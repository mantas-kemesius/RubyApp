# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  render_views

  let(:new_hash2) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'tomas.tomaitis@gmail.com',
                  'password' => 'paswordukas',
                  'age' => 23, 'role' => 'TEACHER' } }
  end

  before { post :register, params: new_hash2 }

  it 'when incorrect resder status 404' do
    expect(response.status).to eq 404
  end

  it 'when incorrect resder body Failed' do
    expect(response.body.match?('Failed!')).to eq true
  end
end
