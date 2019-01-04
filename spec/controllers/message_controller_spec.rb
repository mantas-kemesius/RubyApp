# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageController, type: :controller do
  it 'message deleted' do
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
    post :delete, params: { text: 'new' }
    expect(Message.find_by(text: 'new')).to be nil
  end

  it 'message created' do
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
    expect(Message.find_by(text: 'new')).not_to be nil
  end

  it 'cant create two with same text' do
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
    post :create, params: { message: { text: 'new', from: 11, to: 21 } }
    expect(Message.find_by(to: 21)).to be nil
  end

  it 'two messages created' do
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
    post :create, params: { message: { text: 'new2', from: 11, to: 21 } }
    expect(Message.find_by(to: 21)).not_to be nil
  end

  it 'message not created mock' do
    greeter = instance_spy('greeter')
    allow(Message).to receive(:find_by).and_return(greeter)
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
    expect_any_instance_of(Message).not_to receive(:save)
  end

  it 'message created mock' do
    expect_any_instance_of(Message).to receive(:save)
    post :create, params: { message: { text: 'new', from: 10, to: 20 } }
  end
end
