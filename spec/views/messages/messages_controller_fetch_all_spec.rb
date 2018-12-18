# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageController, type: :controller do
  render_views

  it 'should have id key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('id')).to eq true
  end

  it 'should have text key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    # puts response.body.inspect
    expect(response.body.match?('text')).to eq true
  end

  it 'should have from key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('from')).to eq true
  end

  it 'should have to key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('to')).to eq true
  end

  it 'should have hey value' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"text":"hey"')).to eq true
  end

  it 'should have 20 id value' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"from":20')).to eq true
  end

  it 'should have 10 id value' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"to":10')).to eq true
  end
end
