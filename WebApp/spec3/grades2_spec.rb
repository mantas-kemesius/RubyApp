require 'spec_helper'

describe Grades do
  context 'when initialized' do
    let(:temp_grades2) do
      described_class.new(
        's1610125', 'Agile Programming', 't1234567', '7'
      )
    end

    it 'study_subject is not nil' do
      expect(temp_grades2.study_subject).not_to eq nil
    end
    it 'teacher_id is in the correct format' do
      regex = /[t]\d{7}$/
      expect(!temp_grades2.teacher_id[regex].nil?).to eq true
    end
    it 'grade is in the correct format' do
      regex = /^(0|1|2|3|4|5|6|7|8|9|10){1}$/
      expect(!temp_grades2.grade[regex].nil?).to eq true
    end
  end
end
