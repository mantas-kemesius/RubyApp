# frozen_string_literal: true

# message controller class
class MessageController < ApplicationController
  protect_from_forgery
  def create
    @message = Message.new
    @message.text = params[:message]['text']
    @message.from = params[:message]['from']
    @message.to = params[:message]['to']
    # abort @subject.inspect
    if @message.save
      render json: 'Success!', status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    @message = Message.destroy(params[:message]['id'])
  end

  def fetch_all
    render json: Message.find_each
  end
end
