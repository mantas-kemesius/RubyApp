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

  it 'when incorect status 404' do
    post :login, params: new_hash2
    expect(response.status).to eq 404
  end

  it 'when incorect body failed' do
    post :login, params: new_hash2
    expect(response.body.match?('Failed!')).to eq true
  end

  it 'when correct status 200' do
    login_hash = { 'user' => { 'email' => 'samuolaitis@gmail.com',
                               'password' => 'slaptazodisxd' } }
    post :login, params: login_hash
    expect(response.status).to eq 200
  end

  it 'when login is incorect status 404' do
    login_hash = { 'user' => { 'email' => 'samuolaitiss@gmail.com',
                               'password' => 'slaptazodisxd' } }
    post :login, params: login_hash
    expect(response.status).to eq 404
  end

  it 'when corect body has info' do
    login_hash = { 'user' => { 'email' => 'samuolaitis@gmail.com',
                               'password' => 'slaptazodisxd' } }
    post :login, params: login_hash
    teststr = ',"email":"samuolaitis@gmail.com","name":"Antanas",'
    expect(response.body.match?(teststr)).to be true
  end
end
