# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:new_hash) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'testas@testaitis.com',
                  'password' => 'paswordukas',
                  'age' => '28', 'role' => 'TEACHER' } }
  end

  it 'creating a user is successful' do
    post :register, params: new_hash
    usr = User.find_by(email: 'testas@testaitis.com')
    expect(usr.name.eql?('testas')).to be true
  end

  it 'created user is not found' do
    post :register, params: new_hash
    usr = User.find_by(email: 'testas@testaitis.com')
    expect(usr.name.eql?('rip')).not_to be true
  end

  it 'login successful with correct data' do
    login_hash = { 'user' => { 'email' => 'samuolaitis@gmail.com',
                               'password' => 'slaptazodisxd' } }
    post :login, params: login_hash
  end

  it 'login failed with incorrect data' do
    failed_hash = { 'user' => { 'email' => 'fail@gmail.com',
                                'password' => 'notfound' } }
    post :login, params: failed_hash
  end

  it 'empty user params do not' do
    test_hash = { 'user' => 'invalid' }
    expect_any_instance_of(UserController).not_to receive(:register)
    get :login, params: test_hash
  end

  it 'successfully fetches users' do
    allow_any_instance_of(UserController).to receive(:fetch_all).and_return(true)
  end
end
