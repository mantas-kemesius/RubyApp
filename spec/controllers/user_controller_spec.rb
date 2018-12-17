# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:uc) do
    uc = described_class
    allow_any_instance_of(uc).to receive(:login).and_return(true)
    uc
  end

  let(:new_hash) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'testas@testaitis.com',
                  'password' => 'paswordukas',
                  'age' => '28', 'role' => 'TEACHER' } }
  end

  let(:del_hash) do
    { 'user' => { 'name' => 'vienas', 'lastname' => 'vienasis',
                  'email' => 'vienas@vienasis.com',
                  'password' => 'paswordukas',
                  'age' => '25', 'role' => 'STUDENT' } }
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

  it 'deletes user' do
    post :register, params: del_hash
    usr = User.find_by(email: 'vienas@vienasis.com')
    post :delete, params: { 'user' => { :id => usr.id } }
    usr = User.find_by(email: 'vienas@vienasis.com')
    expect(usr).to be nil
  end

  it 'modifies user age' do
    age = rand(99)
    if !User.find_by(email: 'tomas.tomaitis@gmail.com')
      post :register, params: { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                                            'email' => 'tomas.tomaitis@gmail.com',
                                            'password' => 'paswordukas',
                                            'age' => 23, 'role' => 'TEACHER' } }
    end
    post :modify_age, params: { :user => { :email => 'tomas.tomaitis@gmail.com', :age => age }}
    usr = User.find_by(email: 'tomas.tomaitis@gmail.com')
    expect(usr.age.eql?(age)).to be true
  end
end
