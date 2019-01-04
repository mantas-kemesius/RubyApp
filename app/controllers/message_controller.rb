# frozen_string_literal: true

# message controller class
# :reek:InstanceVariableAssumption
class MessageController < ApplicationController
  protect_from_forgery
  def create
    @message = Message.new
    message = params.fetch(:message)
    check_spam(message)
  end

  def setvalues(message)
    @message.text = message.fetch('text')
    @message.from = message.fetch('from')
    @message.to = message.fetch('to')
    @message.save
  end

  def delete
    @message.destroy
  end

  def fetch_all
    render json: Message.find_each
  end

  def check_spam(messagein)
    text = messagein.fetch('text')
    message = Message.find_by(text: text)
    return unless message.equal?(nil)

    setvalues(messagein)
  end
end
