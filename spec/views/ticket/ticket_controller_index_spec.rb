# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'index view have span with words all tickets' do
    post :create, params: { ticket: { ticket: 'new' } }
    get :index
    expect(
      response.body.match?('<span class="txt-highl">All tickets:</span>')
    ).to eq true
  end

  it 'index view have created ticket' do
    post :create, params: { ticket: { ticket: 'new' } }
    get :index
    expect(
      response.body.match?('new\n')
    ).to eq true
  end

  it 'index view have link' do
    get :index
    expect(
      response.body.match?('<a href="/ticket/create">Add new task</a>')
    ).to eq true
  end

  it 'index view have breakpoint' do
    get :index
    expect(
      response.body.match?('<br>')
    ).to eq true
  end

  it 'index view have header' do
    get :index
    expect(
      response.body.match?('<h1>Here you could check all tickets</h1>')
    ).to eq true
  end

  it 'index view have javascript lib files' do
    get :index
    expect(response.body
               .match?('<script src="js/vendor.js"></script>')).to eq true
  end

  it 'index view have javascript files' do
    get :index
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end
