require 'spec_helper'

describe Schedule do
  context 'when created' do
    let(:temp_schedule) do
      described_class.new('2', '14:00', '213', 'Programavimas',
                          't1610179')
    end

    it 'date_day is in correct format' do
      regex = /(1|2|3|4|5){1}$/
      expect(!temp_schedule.date_day[regex].nil?).to eq true
    end
    it 'date_time is in correct format' do
      regex = /^((([0-1][0-9])|([2][0-3])):([0-5][0-9]))$/
      expect(!temp_schedule.date_time[regex].nil?).to eq true
    end
    it 'class_number is in correct format' do
      regex = /[1-4][0-3][0-9]$/
      expect(!temp_schedule.class_number[regex].nil?).to eq true
    end
    it 'subject_name is not empty' do
      expect(temp_schedule.subject_name).not_to eq ''
    end
    it 'teacher_id is in correct format' do
      regex = /[t]\d{7}$/
      expect(!temp_schedule.teacher_id[regex].nil?).to eq true
    end
  end
end
