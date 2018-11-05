require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe Student do
  context 'when loading' do
    let(:path_to_db) { 'fakeDatabase/testFiles/test_student.json' }
    let(:student) do
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

    it 'save student read student program' do
      student.save_student(path_to_db)
      student.change_study_program('PS')
      student.load_student(path_to_db)
      expect(student.study_program).to eq 'Informatika'
      student.delete_student_file(path_to_db)
    end

    it 'save student add subject load' do
      student.save_student(path_to_db)
      student.add_subjects('Rusu')
      student.load_student(path_to_db)
      expect(student.subjects.length).to eq 2
      student.delete_student_file(path_to_db)
    end

    it 'save student read mode' do
      student.save_student(path_to_db)
      student.change_mode('Vakarinis')
      student.load_student(path_to_db)
      expect(student.mode).to eq 'Dieninis'
      student.delete_student_file(path_to_db)
    end

    it 'deletefile' do
      student.save_student(path_to_db)
      expect(student.delete_student_file(path_to_db)).to eq true
    end

    it 'adds subject' do
      expect { student.add_subjects('Rusu') }
        .to change { student.subjects.last }
        .from('Matematika').to('Rusu')
    end

    it 'adds subject check size' do
      expect { student.add_subjects('Rusu') }
        .to change { student.subjects.length }
        .from(2).to(3)
    end

    it 'remove first subject ' do
      student.remove_first_subjects
      student.add_subjects('Rusu')
      expect(student.subjects).to eq %w[Matematika Rusu]
    end

    it 'remove first subject check size' do
      student.add_subjects('Rusu')
      student.remove_first_subjects
      expect(student.subjects.size).to eq 2
    end

    it 'check if array empty' do
      expect(student.subjects.empty?).to eq false
    end

    it 'remove some subject check size' do
      student.add_subjects('Rusu')
      expect { student.remove_subjects('Matematika') }
        .to change { student.subjects.size }
        .from(3).to(2)
    end

    it 'remove some subject ' do
      expect { student.remove_subjects('Matematika') }
        .to change { student.subjects }
        .from(%w[Ruby Matematika]).to(['Ruby'])
    end

    it 'when init active level ' do
      expect(student.active).to eq 1
    end

    it 'when changing active level ' do
      expect { student.change_active(0) }
        .to change { student.active }
        .from(1).to(0)
    end

    it 'when init mode  ' do
      expect(student.mode).to eq 'Dieninis'
    end

    it 'when changing mode  ' do
      expect { student.change_mode('Vakarinis') }
        .to change { student.mode }
        .from('Dieninis').to('Vakarinis')
    end
  end
end
