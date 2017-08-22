class TicketRepository < Hanami::Repository
  def by_folder(folder_id)
    tickets.where("folder_ids @> ARRAY[?]::bigint[]", folder_id)
  end

  def by_customer(customer_id)
    tickets.where(customer_id: customer_id)
  end
end
