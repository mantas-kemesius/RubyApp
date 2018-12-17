# frozen_string_literal: true

require 'rails_helper'


RSpec.describe SsubjectsController, type: :controller do
  render_views

  it 'should have stundet_id key' do
    post :create, params: { ssubject: { student_id: 20, subject_id: 10 } }
    get :fetch_all
    expect(response.body.match?('student_id')).to eq true
  end

  it 'should have subject_id key' do
    post :create, params: { ssubject: { student_id: 20, subject_id: 10 } }
    get :fetch_all
    expect(response.body.match?('subject_id')).to eq true
  end

  it 'should have student_id: 20' do
    post :create, params: { ssubject: { student_id: 20, subject_id: 10 } }
    get :fetch_all
    expect(response.body.match?('subject_id')).to eq true
  end

  it 'should have subject_id: 10' do
    post :create, params: { ssubject: { student_id: 20, subject_id: 10 } }
    get :fetch_all
    expect(response.body.match?('subject_id')).to eq true
  end
end