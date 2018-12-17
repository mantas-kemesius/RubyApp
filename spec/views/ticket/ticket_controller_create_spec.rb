# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  render_views

  it 'create view have form' do
    get :create
    expect(response.body.match?('form')).to be true
  end

  it 'create view have submit button' do
    get :create
    expect(response.body.match?('submit')).to be true
  end

  it 'create view have ticket input' do
    get :create
    expect(response.body.match?('input')).to be true
  end

  it 'create view form action is to /ticket/create' do
    get :create
    expect(response.body.match?('action="/ticket/create"')).to be true
  end

  it 'create view submit name should be add' do
    get :create
    expect(response.body.match?(`value="Add"`)).to be true
  end
end