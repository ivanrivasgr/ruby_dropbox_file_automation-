# frozen_string_literal: true

# Constants used by the Dropbox → Data Collector automation
module FileAutomation
  module Helpers
    module Constants

      DROPBOX_ROOT_FOLDER = "/ClientXYZ" # Folder where client uploads CSV files

      # Map file prefixes to target folder IDs (or whatever routing logic you need)
      FILE_TYPE_MAPPING = {
        "CUST" => 1001, # Customers
        "ORD"  => 1002, # Orders
        "INV"  => 1003  # Invoices
      }.freeze

      # Output file names generated after processing
      CLEANED_CUSTOMERS_FILE = "customers.csv"
      CLEANED_ORDERS_FILE    = "orders.csv"
      CLEANED_INVOICES_FILE  = "invoices.csv"

      # CSV header definitions for normalization
      CUSTOMER_HEADERS = [
        "Customer_ID", "Name", "City", "Country", "Phone"
      ].freeze

      ORDER_HEADERS = [
        "Order_ID", "Customer_ID", "Item", "Quantity", "Order_Date", "External_ID"
      ].freeze

      INVOICE_HEADERS = [
        "Invoice_ID", "Order_ID", "Invoice_Date", "Amount", "External_ID"
      ].freeze

    end
  end
end

