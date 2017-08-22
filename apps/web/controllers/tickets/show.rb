module Web::Controllers::Tickets
  class Show
    include Web::Action

    expose :ticket
    expose :messages

    def call(params)
      @ticket = TicketRepository.new.find(params[:id])
      @messages = MessageRepository.new.by_ticket(@ticket.id).order(:created_at)
    end
  end
end
