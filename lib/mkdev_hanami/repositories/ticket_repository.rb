class TicketRepository < Hanami::Repository
  associations do
    has_many :messages
  end

  def find_with_messages(id)
    aggregate(:messages).map_to(Ticket).one
  end

  def by_folder(folder_id)
    tickets.where("folder_ids @> ARRAY[?]::bigint[]", folder_id)
  end

  def by_customer(customer_id)
    tickets.where(customer_id: customer_id)
  end
end
