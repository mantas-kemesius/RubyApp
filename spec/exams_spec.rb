require 'spec_helper'

describe Exams do
  context 'when initialized' do
    let(:temp_exams) do
      described_class.new(
        'Objective C',
        'month' => '1',
        'day' => '30',
        'time' => '08:30'
      )
    end

    it 'subject_name has the correct value' do
      expect(temp_exams.subject_name).to eq 'Objective C'
    end
    it 'subject_name is not empty' do
      expect(temp_exams.subject_name).not_to eq nil
    end
    it 'date_month has the correct value' do
      expect(temp_exams.date_month).to eq '1'
    end
    it 'date_day has the correct value' do
      expect(temp_exams.date_day).to eq '30'
    end
    it 'date_time has the correct value' do
      expect(temp_exams.date_time).to eq '08:30'
    end
  end
end
