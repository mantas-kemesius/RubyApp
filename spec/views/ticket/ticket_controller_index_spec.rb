# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'index view have span with words all tickets' do
    get :index
    expect(response.body.match?('<span class="txt-highl">All tickets:</span>')).to be true
  end

  it 'index view have link' do
    get :index
    expect(response.body.match?('<a href="/ticket/create">Add new task</a>')).to be true
  end

  it 'index view have link' do
    get :index
    expect(response.body.match?('<a href="/ticket/create">Add new task</a>')).to be true
  end

  it 'index view have link' do
    get :index
    expect(response.body.match?('<h1>Here you could check all tickets</h1>')).to be true
  end
end