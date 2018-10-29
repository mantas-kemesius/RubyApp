require 'spec_helper'

describe Schedule do
  context 'when created' do
    let(:temp_schedule) do
      described_class.new(
        {
          'day' => '2',
          'time' => '14:00'
        }, '213', 'subject' => 'Programavimas', 'teacher' => 't1610179'
      )
    end

    it 'date_day has the correct value' do
      expect(temp_schedule.date_day).to eq '2'
    end
    it 'date_time has the correct value' do
      expect(temp_schedule.date_time).to eq '14:00'
    end
    it 'class_number has the correct value' do
      expect(temp_schedule.class_number).to eq '213'
    end
    it 'subject_name has the correct value' do
      expect(temp_schedule.subject_name).to eq 'Programavimas'
    end
    it 'teacher_id has the correct value' do
      expect(temp_schedule.teacher_id).to eq 't1610179'
    end
  end
end
