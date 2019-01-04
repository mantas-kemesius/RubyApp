# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  render_views

  let(:new_hash) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'testas@testaitis.com',
                  'password' => 'paswordukas',
                  'age' => '28', 'role' => 'TEACHER' } }
  end

  it 'has status 404 when failed' do
    subjectspy = instance_spy('subjectspy', save: false)
    allow(User).to receive(:new).and_return(subjectspy)
    post :register, params: new_hash
    expect(response.status).to eq 404
  end

  it 'has body failed when unsuccesful' do
    subjectspy = instance_spy('subjectspy', save: false)
    allow(User).to receive(:new).and_return(subjectspy)
    post :register, params: new_hash
    expect(response.body.match?('Failed!')).to eq true
  end
end
