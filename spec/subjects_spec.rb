require 'spec_helper'
describe Subject do
  context 'when created' do
    let(:temp_subject) do
      described_class.new('Ruby Programming', 'Agile Programming Ruby',
                          'Ruby.pdf', '5', 't1610179')
    end

    it 'Coordinating teacher ID correct format' do
      regex = /[t]\d{7}$/
      expect(!temp_subject.coordinating_teacher[regex].nil?).to eq true
    end
    it 'Coordinating teacher set correct' do
      expect(temp_subject.coordinating_teacher).to eq 't1610179'
    end
    it 'Credit number set correct' do
      expect(temp_subject.number_of_credits).to eq '5'
    end
  end
end
