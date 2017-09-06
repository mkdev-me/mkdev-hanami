require_relative "../services/intercom"

class ExportTicketsJob
  include SuckerPunch::Job

  def perform(ticket)
    Services::Intercom.new(ticket).export
  end
end
