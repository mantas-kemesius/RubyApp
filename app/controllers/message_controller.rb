# frozen_string_literal: true

# message controller class
# :reek:InstanceVariableAssumption
class MessageController < ApplicationController
  protect_from_forgery
  def create
    parameters = params.fetch(:message)
    @message = Message.new
    @message.text = parameters.fetch('text')
    @message.from = parameters.fetch('from')
    @message.to = parameters.fetch('to')
    @message.save
  end

  def delete
    @message.destroy
  end

  def fetch_all
    render json: Message.find_each
  end
end
