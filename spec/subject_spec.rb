require 'spec_helper'
describe Subject do
  context 'when created' do
    let(:subject) { described_class.new('Ruby Programming', 'Agile Programming Ruby',
                                        'Ruby.pdf', '5', 't1610179') }
    it 'Subject name set correct' do
      expect(subject.name).to eq 'Ruby Programming'
    end
    it 'Subject description set correct' do
      expect(subject.description_text).to eq 'Agile Programming Ruby'
    end
    it 'Subject description file correct format' do
      regex = /\w+[.][p][d][f]$/
      expect(!subject.description_file[regex].nil?).to eq true
    end
    it 'Subject description file set correct' do
      expect(subject.description_file).to eq 'Ruby.pdf'
    end
    it 'Credit number correct format' do
      regex = /^(3|4|5|6|7|8|9|10|11|12|13|14|15){1}$/
      expect(!subject.number_of_credits[regex].nil?).to eq true
    end
    it 'Credit number set correct' do
      expect(subject.number_of_credits).to eq '5'
    end
  end
end

describe Subject do
  context 'when created' do
    let(:subject) { described_class.new('Ruby Programming', 'Agile Programming Ruby',
                                        'Ruby.pdf', '5', 't1610179') }
    it 'Coordinating teacher ID correct format' do
      regex = /[t]\d{7}$/
      expect(!subject.coordinating_teacher[regex].nil?).to eq true
    end
    it 'Coordinating teacher set correct' do
      expect(subject.coordinating_teacher).to eq 't1610179'
    end
  end
end
