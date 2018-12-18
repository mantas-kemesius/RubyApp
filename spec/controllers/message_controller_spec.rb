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
end
