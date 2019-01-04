# frozen_string_literal: true

require_relative '../rails_helper'

describe LecturesController do
  fixtures :all

  let(:newpr) do
    { lecture: { teacher: 'teach@gmail.com', id: '201812',
                 status: 'Active', name: 'Komparchas', credits: 5 } }
  end

  let(:edt) do
    { lecture: { teacher: 'teach2@mail.com', id: '9999',
                 status: 'Inactive', name: 'Algebra', credits: 10 } }
  end

  it 'covers mutation -if key' do
    expect { post :update, params: {} }.not_to raise_error(NoMethodError)
  end

  it 'actually deletes project' do
    post :destroy, params: { id: '99_88' }
    lect = Lecture.find_by(id: 99_88)
    expect(lect).to be nil
  end

  it 'student added' do
    expect_any_instance_of(Lecture).to receive(:add_student).with('notexisted')
    post :addstudent, params: { lecture: { name: 'notexisted' },
                                id: '99_88' }
  end

  it 'student size increased' do
    lect = Lecture.find_by(id: 99_88)
    post :addstudent, params: { lecture: { name: 'laas' },
                                id: '99_88' }
    expect(lect.student_getter.count).to be 1
  end

  it 'student is not added with empty params' do
    expect_any_instance_of(Lecture).not_to receive(:add_student)
    post :addstudent, params: {}
  end

  it 'student name is written' do
    post :addstudent, params: { lecture: { name: 'notexisted' },
                                id: '9988' }
    expect(Student.find_by(name: 'notexisted').name)
      .to eq 'notexisted'
  end

  context 'when creating a project' do
    subject(:subj) { described_class.new }

    before do
      allow_any_instance_of(described_class)
        .to receive(:params).and_return(newpr)
    end

    it 'correct teacher' do
      subj.send(:create)
      lect = Lecture.find_by(name: 'Komparchas')
      expect(lect.teacher).to eq 'teach@gmail.com'
    end

    it 'correct status' do
      subj.send(:create)
      lect = Lecture.find_by(name: 'Komparchas')
      expect(lect.status).to eq 'Active'
    end

    it 'correct credits' do
      subj.send(:create)
      lect = Lecture.find_by(name: 'Komparchas')
      expect(lect.credits).to eq 5
    end
  end

  context 'when editing a lecture' do
    before do
      allow_any_instance_of(described_class)
        .to receive(:params).and_return(edt)
    end

    it do
      controller.credsmanag
      expect(assigns(:lect)).to eq teacher: 'teach2@mail.com', id: '9999',
                                   credits: 10, status: 'Inactive',
                                   name: 'Algebra'
    end

    it 'present params used in post update' do
      expect_any_instance_of(StudyManagement).to receive(:credits_setter)
      post :update
    end

    it 'only loads view when getting edit form' do
      expect_any_instance_of(StudyManagement).not_to receive(:credits_setter)
      get :edit
    end

    it 'edits name' do
      post :update
      lect = Lecture.find_by(id: edt[:lecture][:id])
      expect(lect.name).to eq 'Algebra'
    end

    it 'edits status' do
      post :update
      lect = Lecture.find_by(id: edt[:lecture][:id])
      expect(lect.status).to eq 'Inactive'
    end

    it 'edits teacher' do
      post :update
      lect = Lecture.find_by(id: edt[:lecture][:id])
      expect(lect.teacher).to eq 'teach2@mail.com'
    end

    it 'edits credits' do
      post :update
      lect = Lecture.find_by(id: edt[:lecture][:id])
      expect(lect.credits).to be 10
    end
  end
end
