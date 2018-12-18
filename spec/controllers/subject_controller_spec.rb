# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubjectController, type: :controller do
  let(:newSubject) do
    { subject: { name: 'name', time: 'time' } }
  end

  it 'check or data was created' do
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    expect(Subject.find_by(teacher_id: 1111).name)
      .to eq 'name'
  end

  it 'check or deleted' do
    post :create, params: { subject: { name: 'name', time: 'time', id: 1111 } }
    subject = Subject.find_by(teacher_id: 1111)
    post :delete, params: { subject: { id: subject.id } }
    subject = Subject.find_by(teacher_id: 1111)
    expect(subject).to eq nil
  end
end
