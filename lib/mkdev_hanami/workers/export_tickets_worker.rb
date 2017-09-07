class ExportTicketsWorker
  include Sidekiq::Worker

  def perform(ticket)
    Intercom.new(ticket).call
  end
end
