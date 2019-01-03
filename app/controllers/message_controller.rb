# frozen_string_literal: true

# message controller class
# :reek:InstanceVariableAssumption
class MessageController < ApplicationController
  protect_from_forgery
  # :reek:DuplicateMethodCall
  def create
    @message = Message.new
    @message.text = params.fetch(:message).fetch('text')
    @message.from = params.fetch(:message).fetch('from')
    @message.to = params.fetch(:message).fetch('to')
    @message.save
  end

  def delete
    @message.destroy
  end

  def fetch_all
    render json: Message.find_each
  end
end
