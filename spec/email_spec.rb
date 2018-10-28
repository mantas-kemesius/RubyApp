require 'spec_helper'

describe Email do
  context 'initial data is set successfully when' do
    let(:email) do
      described_class.new('jonas.jonaitis@gmail.com',
                          'Test email', 'Test email')
    end

    it 'user last name is set correctly' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'user email is set correctly' do
      expect(email.title).to eq 'Test email'
    end
    it 'email to is set correctly' do
      expect(email.text).to eq 'Test email'
    end
  end
end
