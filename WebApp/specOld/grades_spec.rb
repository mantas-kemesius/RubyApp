require 'spec_helper'

describe Grades do
  context 'when initialized' do
    let(:temp_grades) do
      described_class.new(
        's1610125', 'Agile Programming', 't1234567', '7'
      )
    end

    it 'student_id has the correct value' do
      expect(temp_grades.student_id).to eq 's1610125'
    end
    it 'study_subject has the correct value' do
      expect(temp_grades.study_subject).to eq 'Agile Programming'
    end
    it 'teacher_id has the correct value' do
      expect(temp_grades.teacher_id).to eq 't1234567'
    end
    it 'grade has the correct value' do
      expect(temp_grades.grade).to eq '7'
    end
    it 'student_id is in the correct format' do
      regex = /[s]\d{7}$/
      expect(!temp_grades.student_id[regex].nil?).to eq true
    end
  end
end
