# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubjectController, type: :controller do
  render_views

  it 'expected to have teacher_id key' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('teacher_id')).to eq true
  end

  it 'expected to have time key' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('time')).to eq true
  end

  it 'expected to have name key' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('name')).to eq true
  end

  it 'expected to have teacher_id\":1111' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('\"teacher_id\":1111')).to eq true
  end

  it 'expected to have time: time' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('"time":"time"')).to eq true
  end

  it 'expected to have name: name' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    get :fetch_all
    expect(response.body.match?('"name":"names"')).to eq true
  end

  it 'expected to have status success' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    expect(response.status).to eq 200
  end

  it 'expected to have body when success' do
    testbody = '"name":"names","time":"time","teacher_id":1111,'
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    expect(response.body.match?(testbody)).to eq true
  end

  it 'has status 404 when failed' do
    subjectspy = instance_spy('subjectspy', save: false)
    allow(Subject).to receive(:new).and_return(subjectspy)
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    expect(response.status).to eq 404
  end

  it 'has body failed when unsuccesful' do
    subjectspy = instance_spy('subjectspy', save: false)
    allow(Subject).to receive(:new).and_return(subjectspy)
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    expect(response.body.match?('Failed!')).to eq true
  end
end
