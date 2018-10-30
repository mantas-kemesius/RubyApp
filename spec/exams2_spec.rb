require 'spec_helper'

describe Exams do
  context 'when initialized' do
    let(:temp_exams2) do
      described_class.new(
        'Objective C',
        'month' => '1',
        'day' => '18',
        'time' => '08:30'
      )
    end

    it 'date_month is in correct format' do
      regex = /(1|2|3|4|5|6|7|8|9|10|11|12){1}$/
      expect(!temp_exams2.date_month[regex].nil?).to eq true
    end
    it 'date_day is in correct format' do
      regex = /(1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17){1}$/
      expect(!temp_exams2.date_day[regex].nil?).to eq true
    end
    it 'date_time is in correct format' do
      regex = /((([0-1][0-9])|([2][0-3])):([0-5][0-9]))$/
      expect(!temp_exams2.date_time[regex].nil?).to eq true
    end
  end
end
