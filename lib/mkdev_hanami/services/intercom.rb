require 'intercom'

module Services
  class Intercom
    attr_reader :client, :ticket, :messages, :customer

    def initialize(ticket)
      @ticket = ticket
      @messages = ticket.messages
      @customer = ticket.customer
      @client ||= ::Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN'])
    end

    def export
      from = find_or_create_contact(customer.email)
      conversation_message = client.messages.create({ from: from, body: messages.first.body })
      conversation = client.conversations.find_all(email: email).select do |conversation|
        conversation.conversation_message.id == conversation_message.id
      end.first
      client.conversations.reply(id: conversation.id, type: 'admin', message_type: 'comment', body: messages.last.body, admin_id: ENV["INTERCOM_ADMIN_ID"])
      if ticket.state == 'closed'
        client.conversations.reply(id: conversation.id, type: 'admin', message_type: 'close', admin_id: ENV["INTERCOM_ADMIN_ID"])
      end
    end

    def find_or_create_contact(email)
      contact = client.users.find(email: email)
      type = 'user'
    rescue ::Intercom::ResourceNotFound
      contact = client.contacts.find_all(email: email).first || client.contacts.create(email: email)
      type = 'contact'
    ensure
      return { type: type, id: contact.id }
    end
  end
end
