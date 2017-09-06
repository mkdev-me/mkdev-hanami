require_relative "../jobs/export_tickets_job"

class Ticket < Hanami::Entity
  def migrate
    ExportTicketsJob.perform_async(self)
  end

  def customer
    CustomerRepository.new.find(customer_id)
  end

  def messages
    MessageRepository.new.by_ticket(id)
  end
end
