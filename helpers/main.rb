# frozen_string_literal: true

require "csv"
require "tempfile"
require_relative "constants"

# Main automation logic: reads files from Dropbox, cleans them, and uploads them to the destination folder
class FileAutomation::Main
  include FileAutomation::Helpers::Constants

  def initialize(dropbox_client:, data_collector_service:)
    @db_client = dropbox_client                # Inject external Dropbox client (dependency injection)
    @collector = data_collector_service       # Inject storage/destination handler
  end

  def call
    uploaded_files = @db_client.list_files(DROPBOX_ROOT_FOLDER)

    uploaded_files.each do |file|
      matched_key = FILE_TYPE_MAPPING.keys.find { |prefix| file.name.start_with?(prefix) }
      next unless matched_key

      case matched_key
      when "CUST" then handle_customer_file(file)
      when "ORD"  then handle_order_file(file)
      when "INV"  then handle_invoice_file(file)
      end
    end
  end

  private

  def handle_customer_file(file)
    process_file(file, CUSTOMER_HEADERS, CLEANED_CUSTOMERS_FILE)
  end

  def handle_order_file(file)
    process_file(file, ORDER_HEADERS, CLEANED_ORDERS_FILE)
  end

  def handle_invoice_file(file)
    process_file(file, INVOICE_HEADERS, CLEANED_INVOICES_FILE)
  end

  # Shared CSV processing logic
  def process_file(file, headers, new_filename)
    temp_file = Tempfile.new(["processed", ".csv"])

    CSV.open(temp_file.path, "wb", write_headers: true, headers: headers) do |csv_output|
      CSV.foreach(@db_client.download(file.path), headers: true) do |row|
        cleaned = normalize_row(row.to_h)
        csv_output << cleaned.values_at(*headers)
      end
    end

    @collector.upload(new_filename, temp_file.path)
    @db_client.delete(file.path)
  ensure
    temp_file.close
    temp_file.unlink
  end

  def normalize_row(row)
    row.transform_values! { |v| v&.strip&.gsub('"', "") }
    row["External_ID"] ||= "#{row["Order_ID"]}-#{row["Item"]}" if row["Order_ID"]
    row
  end
end

