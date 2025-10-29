# frozen_string_literal: true

# Worker to execute automation periodically (cron / background job runner)
class FileAutomation::ScheduledWorker
  def perform
    automation = FileAutomation::Main.new(
      dropbox_client: DropboxClient.new,          # Expected to be defined in the environment
      data_collector_service: DataCollector.new   # Destination handler
    )

    automation.call
  end
end

