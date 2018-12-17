# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'about view have h1 with words all tickets' do
    get :about
    expect(response.body.match?('<h1>About ticket</h1>')).to eq true
  end

  it 'about view have form' do
    get :about
    expect(response.body.match?('<form action = "/ticket/about" method = "post">')).to eq true
  end

  it 'about view have input' do
    get :about
    expect(response.body.match?('<input value = "about"/>')).to eq true
  end

  it 'about view have button' do
    get :about
    expect(response.body.match?('<button>About</button>')).to eq true
  end

  it 'index view have javascript lib files' do
    get :about
    expect(response.body.match?('<script src="js/vendor.js"></script>')).to eq true
  end

  it 'index view have javascript files' do
    get :about
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end