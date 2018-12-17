# # frozen_string_literal: true
#
# # articles controller class
class TicketController < ApplicationController
  def index
  end

  def create
    Ticket.create(ticket: params.fetch(:ticket).fetch(:ticket)) if params.key?(:ticket)
  end

  def destroy
    Ticket.find_by(ticket: params.fetch(:ticket)).destroy
  end
end
