class Ticket < Hanami::Entity
  def migrate
    ExportTicketsWorker.perform_async(self)
  end

  def customer
    CustomerRepository.new.find(customer_id)
  end
end
