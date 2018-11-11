require 'spec_helper'

describe SubjectInfo do
  context 'initial data is set successfully when' do
    let(:temp_subject) do
      described_class.new('Test email', 'Test email')
    end

    it 'credits set correctly' do
      expect(temp_subject.credits).to eq 'Test email'
    end
    it 'teacher set correctly' do
      expect(temp_subject.teacher).to eq 'Test email'
    end
  end
end
