require 'spec_helper'
describe Subject do
  context 'when created' do
    let(:temp_subject) do
      described_class.new('Ruby Programming', 'Agile Programming Ruby',
                          'Ruby.pdf', '5', 't1610179')
    end

    it 'Subject name set correct' do
      expect(temp_subject.name).to eq 'Ruby Programming'
    end
    it 'Subject description set correct' do
      expect(temp_subject.description_text).to eq 'Agile Programming Ruby'
    end
    it 'Subject description file correct format' do
      regex = /\w+[.][p][d][f]$/
      expect(!temp_subject.description_file[regex].nil?).to eq true
    end
    it 'Subject description file set correct' do
      expect(temp_subject.description_file).to eq 'Ruby.pdf'
    end
    it 'Credit number correct format' do
      regex = /^(3|4|5|6|7|8|9|10|11|12|13|14|15){1}$/
      expect(!temp_subject.number_of_credits[regex].nil?).to eq true
    end
  end
end
