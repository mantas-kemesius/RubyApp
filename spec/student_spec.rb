require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe Student do
  context 'when created' do
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
    let(:student_bad) do
      described_class.new(
        's_id' => -123,
        'group' => -10,
        'faculty' => 'MIF',
        'study_program' => 'Informatika',
        'subjects' => %w[Ruby Matematika],
        'active' => 1,
        'mode' => 'Dieninis'
      )
    end

    it 'initial student number was set successful' do
      expect(student.s_id).to eq 123
    end

    it 'initial student number was changed successful' do
      student.change_sid(100)
      expect(student.s_id).to eq 100
    end

    it 'initial student number was changed unsuccessful' do
      student.change_sid(-100)
      expect(student.s_id).to eq 123
    end

    it 'initial student group was set successful' do
      expect(student.group).to eq 10
    end

    it 'initial student faculty was set successful' do
      expect(student.faculty).to eq 'MIF'
    end

    it 'initial student number was set unsuccessful' do
      expect(student_bad.s_id).to eq nil
    end

    it 'initial student group was set unsuccessful' do
      expect(student_bad.group).to eq nil
    end
  end
end
