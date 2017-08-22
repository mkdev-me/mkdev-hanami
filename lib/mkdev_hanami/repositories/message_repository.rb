class MessageRepository < Hanami::Repository
  def by_ticket(ticket_id)
    messages.where(ticket_id: ticket_id)
  end
end
