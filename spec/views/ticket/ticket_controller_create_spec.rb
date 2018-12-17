# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'create view have form' do
    get :create
    expect(response.body.match?('form')).to eq true
  end

  it 'create view have submit button' do
    get :create
    expect(
        response.body.match?('submit')
    ).to eq true
  end

  it 'create view have ticket input' do
    get :create
    expect(response.body.match?('input')).to eq true
  end

  it 'create view form action is to /ticket/create' do
    get :create
    expect(
        response.body.match?('action="/ticket/create"')
    ).to eq true
  end

  it 'create view submit name should be add' do
    get :create
    expect(response.body.match?(`value="Add"`)).to eq true
  end

  it 'index view have javascript lib files' do
    get :index
    expect(response.body.match?('<script src="js/vendor.js"></script>')).to eq true
  end

  it 'index view have javascript files' do
    get :index
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end