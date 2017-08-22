module Web::Controllers::Customers
  class Show
    include Web::Action

    expose :customer
    expose :tickets

    def call(params)
      @customer = CustomerRepository.new.find(params[:id])
      @tickets = TicketRepository.new.by_customer(@customer.id)
    end
  end
end
