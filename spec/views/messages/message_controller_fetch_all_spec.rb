# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageController, type: :controller do
  render_views

  it 'expected to have id key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('id')).to eq true
  end

  it 'expected to have text key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    # puts response.body.inspect
    expect(response.body.match?('text')).to eq true
  end

  it 'expected to have from key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('from')).to eq true
  end

  it 'expected to have to key' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('to')).to eq true
  end

  it 'expected to have hey value' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"text":"hey"')).to eq true
  end

  it 'expected to have id value of 20' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"from":20')).to eq true
  end

  it 'expected to have id value of 10' do
    post :create, params: { message: { text: 'hey', from: 20, to: 10 } }
    get :fetch_all
    expect(response.body.match?('"to":10')).to eq true
  end
end
