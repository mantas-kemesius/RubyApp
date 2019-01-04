# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubjectController, type: :controller do
  let(:newSubject) do
    { subject: { name: 'name', time: 'time' } }
  end

  it 'check or data was created' do
    post :create, params: { subject: { name: 'names', time: 'time', id: 1111 } }
    expect(Subject.find_by(teacher_id: 1111).name)
      .to eq 'names'
  end

  it 'check or data was created time' do
    post :create, params: { subject: { name: 'name', time: 'times', id: 1111 } }
    expect(Subject.find_by(teacher_id: 1111).time)
      .to eq 'times'
  end

  it 'check or data was created teacher' do
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    expect(Subject.find_by(teacher_id: 1111).teacher_id)
      .to eq 1111
  end

  it 'check or deleted' do
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    subject = Subject.find_by(teacher_id: 1111)
    post :delete, params: { subject: { id: subject.id } }
    subject = Subject.find_by(teacher_id: 1111)
    expect(subject).to eq nil
  end

  it 'check assign was called' do
    expect_any_instance_of(SubjectController).to receive(:assign)
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
  end
end
