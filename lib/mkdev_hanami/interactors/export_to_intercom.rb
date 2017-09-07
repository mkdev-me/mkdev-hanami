require 'hanami/interactor'
require 'intercom'

class ExportToIntercom
  include Hanami::Interactor

  def initialize(ticket)
    @ticket = ticket
    @messages = TicketRepository.new.find_with_messages(ticket.id).messages
    @customer = ticket.customer
    @client ||= Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN'])
  end

  def call
    export!
  end

  private

  def export!
    from = find_or_create_contact(@customer.email)
    conversation_message = @client.messages.create({ from: from, body: @messages.first.body })
    conversation = @client.conversations.find_all(email: @customer.email).select do |conversation|
      conversation.conversation_message.id == conversation_message.id
    end.first
    @client.conversations.reply(id: conversation.id, type: 'admin', message_type: 'comment', body: @messages.last.body, admin_id: ENV["INTERCOM_ADMIN_ID"])
    if ticket.state == 'closed'
      @client.conversations.reply(id: conversation.id, type: 'admin', message_type: 'close', admin_id: ENV["INTERCOM_ADMIN_ID"])
    end
  rescue
    fail!
  end

  def find_or_create_contact(email)
    contact = @client.users.find(email: email)
    type = 'user'
  rescue Intercom::ResourceNotFound
    contact = @client.contacts.find_all(email: email).first || @client.contacts.create(email: email)
    type = 'contact'
  ensure
    return { type: type, id: contact.id }
  end
end
