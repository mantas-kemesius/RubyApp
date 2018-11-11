# frozen_string_literal: true

require 'spec_helper'

describe Schedule do
  context 'when initialized' do
    let(:temp_schedule2) do
      described_class.new(
        {
          'day' => '2',
          'time' => '14:00'
        }, '213', 'subject' => 'Programavimas', 'teacher' => 't1610179'
      )
    end

    it 'date_day is in correct format' do
      regex = /(1|2|3|4|5){1}$/
      expect(!temp_schedule2.date_day[regex].nil?).to eq true
    end
    it 'date_time is in correct format' do
      regex = /((([0-1][0-9])|([2][0-3])):([0-5][0-9]))$/
      expect(!temp_schedule2.date_time[regex].nil?).to eq true
    end
    it 'class_number is in correct format' do
      regex = /[1-4][0-3][0-9]$/
      expect(!temp_schedule2.class_number[regex].nil?).to eq true
    end
    it 'subject_name is not empty' do
      expect(temp_schedule2.subject_name).not_to be_nil
    end
  end
end
