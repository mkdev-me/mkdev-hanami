module Web::Controllers::Tickets
  class Export
    include Web::Action

    def call(params)
      ticket = TicketRepository.new.find(params[:id])
      ticket.migrate
      redirect_to '/'
    end
  end
end
