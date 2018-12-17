# frozen_string_literal: true

require 'rails_helper'


RSpec.describe UserController, type: :controller do
  render_views


  let(:new_hash) do
    { 'user' => { 'name' => 'testas', 'last_name' => 'testaitis',
                  'email' => 'testas@testaitis.com',
                  'password' => 'paswordukas',
                  'age' => '28', 'role' => 'TEACHER' } }
  end

  before { post :register, params: new_hash }
  it 'should have id key' do
    get :fetch_all
    expect(response.body.match?('id')).to eq true
  end

  it 'should have name key' do
    get :fetch_all
    expect(response.body.match?('name')).to eq true
  end

  it 'should have last_name key' do
    get :fetch_all
    expect(response.body.match?('last_name')).to eq true
  end

  it 'should have email key' do
    get :fetch_all
    expect(response.body.match?('email')).to eq true
  end

  it 'should have password key' do
    get :fetch_all
    expect(response.body.match?('password')).to eq true
  end

  it 'should have age key' do
    get :fetch_all
    expect(response.body.match?('age')).to eq true
  end

  it 'should have role key' do
    # post :register, params: new_hash
    get :fetch_all
    expect(response.body.match?('role')).to eq true
  end

  it 'should have right name' do
    get :fetch_all
    expect(response.body.match?('"name":"testas"')).to eq true
  end

  it 'should have right lastname' do
    get :fetch_all
    expect(response.body.match?('"last_name":"testaitis"')).to eq true
  end

  it 'should have right password' do
    get :fetch_all
    expect(response.body.match?('"password":"paswordukas"')).to eq true
  end

  it 'should have right email' do
    get :fetch_all
    expect(response.body.match?('"email":"testas@testaitis.com"')).to eq true
  end

  it 'should have right age' do
    get :fetch_all
    expect(response.body.match?('"age":28')).to eq true
  end

  it 'should have right role' do
    get :fetch_all
    expect(response.body.match?('"role":"TEACHER"')).to eq true
  end


end