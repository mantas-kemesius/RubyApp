# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'about view have h1 with words all tickets' do
    get :about
    expect(response.body.match?('<h1>About ticket</h1>')).to be true
  end

  it 'about view have form' do
    get :about
    expect(response.body.match?('<form action = "/ticket/about" method = "post">')).to be true
  end

  it 'about view have input' do
    get :about
    expect(response.body.match?('<input value = "about"/>')).to be true
  end

  it 'about view have button' do
    get :about
    expect(response.body.match?('<button>About</button>')).to be true
  end
end