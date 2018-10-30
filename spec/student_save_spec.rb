require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe Student do
  context 'when loading' do
    let(:path_to_db) { 'fakeDatabase/testFiles/test_student.json' }
    let(:stud) do
      described_class.new(
        's_id' => 123,
        'group' => 10,
        'faculty' => 'MIF',
        'study_program' => 'Informatika',
        'subjects' => %w[Ruby Matematika],
        'active' => 1,
        'mode' => 'Dieninis'
      )
    end

    it 'save student read student id' do
      stud.save_student(path_to_db)
      stud.change_sid(111)
      stud.load_student(path_to_db)
      expect(stud.s_id).to eq 123
      stud.delete_student_file(path_to_db)
    end

    it 'save student read student group' do
      stud.save_student(path_to_db)
      stud.change_group(111)
      stud.load_student(path_to_db)
      expect(stud.group).to eq 10
      stud.delete_student_file(path_to_db)
    end

    it 'save student read student faculty' do
      stud.save_student(path_to_db)
      stud.change_faculty('FF')
      stud.load_student(path_to_db)
      expect(stud.faculty).to eq 'MIF'
      stud.delete_student_file(path_to_db)
    end

    it 'save student read student active' do
      stud.save_student(path_to_db)
      stud.change_active(0)
      stud.load_student(path_to_db)
      expect(stud.active).to eq 1
      stud.delete_student_file(path_to_db)
    end
  end
end
