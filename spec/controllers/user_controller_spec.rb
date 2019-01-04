# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:uc) do
    uc = instance_double('Some collaborator')
    allow(uc).to receive(:login).and_return(true)
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

  let(:test_hash) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'tomas.tomaitis@gmail.com',
                  'password' => 'paswordukas',
                  'age' => 23, 'role' => 'TEACHER' } }
  end

  let(:test_hash2) do
    { 'user' => { 'name' => 'testas', 'lastname' => 'testaitis',
                  'email' => 'tom.t@gmail.com',
                  'password' => 'paswordukas',
                  'age' => 23, 'role' => 'TEACHER' } }
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
    usr = User.find_by(email: 'samuolaitis@gmail.com')
    expect(usr.password.eql?('')).to be true
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
    someuser = instance_double('Some User')
    allow(someuser).to receive(:fetch_all).and_return(true)
  end

  it 'deletes user' do
    post :register, params: del_hash
    usr = User.find_by(email: 'vienas@vienasis.com')
    post :delete, params: { 'user' => { id: usr.id } }
    usr = User.find_by(email: 'vienas@vienasis.com')
    expect(usr).to be nil
  end

  context 'when too many lines' do
    let(:check_and_post) do
      unless User.find_by(email: 'tom.t@gmail.com')
        post :register, params: test_hash2
      end
    end
    let(:age) do
      rand(99)
    end
    let(:lastname) do
      'Ripauskas'
    end

    it 'modifies user age' do
      check_and_post
      post :modify_age, params: { user: { email: 'tom.t@gmail.com',
                                          age: age } }
      usr = User.find_by(email: 'tom.t@gmail.com')
      expect(usr.age.eql?(age)).to be true
    end

    it 'modifies user last name' do
      check_and_post
      post :modify_last_name, params: { user: { email: 'tom.t@gmail.com',
                                                last_name: lastname } }
      usr = User.find_by(email: 'tom.t@gmail.com')
      expect(usr.last_name.eql?(lastname)).to be true
    end
  end
end
