# frozen_string_literal: true

require 'spec_helper'

describe SubjectInfo do
  context 'when initial data successfully' do
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
