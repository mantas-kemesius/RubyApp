# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do

  it 'VIEWS TEST: create renders view' do
    post :create
    expect(response).to render_template(:create)
  end

  it 'ticket created' do
    post :create, params: { ticket: { ticket: 'new' } }
    expect(Ticket.find_by(ticket: 'new')).not_to be nil
  end

  it 'ticket not created' do
    t = described_class
    allow_any_instance_of(t).to receive(:create).and_return(true)
    post :create, params: { ticket: { ticket: 'new' } }
    expect(Ticket.find_by(ticket: 'new')).to be nil
  end

  it 'task not deleted' do
    t = described_class
    allow_any_instance_of(t).to receive(:destroy).and_return(true)
    post :destroy, params: { ticket: 'new' }
    expect(Ticket.find_by(ticket: 'new')).to be nil
  end

  it 'task deleted' do
    post :create, params: { ticket: { ticket: 'new' } }
    post :destroy, params: { ticket: 'new' }
    expect(Ticket.find_by(ticket: 'new')).to be nil
  end
end
