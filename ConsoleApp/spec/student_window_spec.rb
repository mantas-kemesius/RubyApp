require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe StudentWindow do
  context 'when loadings' do
    let(:path_to_db) { 'fakeDatabase/testFiles/Students_load.json' }
    let(:file) { FilesHandler.new(path_to_db) }
    let(:item) do
      described_class.new
    end
    let(:load) do
      item.load_students(
        'fakeDatabase/testFiles/Students_load.json'
      )
    end
    let(:student) do
      Student.new('s123', 10, 'Informatika', %w[Ruby Matematika])
    end
    let(:add) do
      item.add_student(student)
      item.add_student(student)
      item.save_students(
        'fakeDatabase/testFiles/Students_save.json'
      )
      item.delete_student(0)
      item.delete_student(0)
      item.load_students(
        'fakeDatabase/testFiles/Students_save.json'
      )
    end

    it 'same object' do
      item.add_student(student)
      expect(item.students[
                 item.students.length - 1]).to eq student
      item.delete_student(0)
    end

    it 'added successful to list' do
      item.add_student(student)
      expect(item.students).not_to be_empty
    end

    it 'list size increased' do
      expect do
        item.add_student(
          student
        )
      end.to change { item.students.length }.by(1)
    end
    it 'single item deleted' do
      item.add_student(student)
      item.delete_student(0)
      expect(item.students[0]).to eq nil
    end
    it 'add with current s_id' do
      item.add_student(student)
      expect(item.students[
                 item.students.length - 1].s_id).to eq 's123'
    end
    it 'add with current group' do
      item.add_student(student)
      expect(item.students[
                 item.students.length - 1].group).to eq 10
    end
    it 'add with current study_program' do
      item.add_student(student)
      expect(item.students[
                 item.students.length - 1].study_program).to eq 'Informatika'
    end
    it 'add with current subjects' do
      item.add_student(student)
      expect(item.students[
                 item.students.length - 1].subjects).to eq %w[Ruby Matematika]
    end
    it 'first item s_id correct' do
      load
      expect(item.students[0].s_id).to eq 's123'
    end
    it 'first item group correct' do
      load
      expect(item.students[0].group).to eq 10
    end
    it 'first item study_program correct' do
      load
      expect(item.students[0].study_program).to eq 'Informatika'
    end
    it 'first item subjects correct' do
      load
      expect(item.students[0].subjects).to eq 'Ruby Matematika'
    end
    it 'after change s_id correct' do
      student.change_sid('s111')
      add
      expect(item.students[1].s_id).to eq 's111'
    end
    it 'after change group correct' do
      student.change_group(3)
      add
      expect(item.students[1].group).to eq 3
    end
    it 'after change student_program correct' do
      student.change_study_program('newText')
      add
      expect(item.students[1].study_program).to eq 'newText'
    end
    it 'after change subjects correct' do
      student.remove_first_subjects
      add
      expect(item.students[1].subjects).to eq ['Matematika']
    end
    it 'after change subjects are correct' do
      student.remove_subjects('Ruby')
      add
      expect(item.students[1].subjects).to eq ['Matematika']
    end
  end

  context 'when searching for student by username' do
    let(:path_to_db) { 'fakeDatabase/testFiles/Students_load.json' }
    let(:file) { FilesHandler.new(path_to_db) }
    let(:item) do
      described_class.new
    end
    let(:load) do
      item.load_students(
        'fakeDatabase/testFiles/Students_load.json'
      )
    end
    let(:student) do
      Student.new('s123', 10, 'Informatika', %w[Ruby Matematika])
    end

    it 'search is successful' do
      load
      found_student = item.student_by_username('s123')
      expect(found_student.s_id).to eq student.s_id
    end

    it 'search is unsuccessful' do
      load
      found_student = item.student_by_username('s184923')
      expect(found_student).to eq nil
    end
  end
end
