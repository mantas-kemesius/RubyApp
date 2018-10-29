require 'spec_helper'

describe Email do
  context 'initial data is set successfully when' do
    let(:email) do
      described_class.new(
        {
          'to' => 'jonas.jonaitis@gmail.com',
          'from' => 'jonas.jonaitis@gmail.com'
        },
        'Test email', 'Test email'
      )
    end
    let(:email_not_valid) do
      described_class.new(
        {
          'to' => '',
          'from' => 1
        },
        '', ''
      )
    end

    it 'sends email' do
      expect(email.send_email).to eq true
    end
    it 'checks or returns array' do
      expect(
        email.add_email_to_email_list.instance_of?(Array)
      ).to eq true
    end
    it 'check valid' do
      load = email.load_email_data
      expect(load['email_to']).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'check valid2' do
      load = email.load_email_data
      expect(load['email_from']).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'check valid3' do
      load = email.load_email_data
      expect(load['text']).to eq 'Test email'
    end
    it 'check valid4' do
      load = email.load_email_data
      expect(load['title']).to eq 'Test email'
    end
    it 'check valid5' do
      load = email.load_email_data
      expect(load.is_a?(Hash)).to eq true
    end
    it 'check valid6' do
      load = email.load_email_data
      expect(load.nil?).to eq false
    end
    it 'check valid7' do
      expect(email.load_emails.nil?).to eq false
    end
    it 'check valid8' do
      expect(email.load_emails.is_a?(Array)).to eq true
    end
    it 'check valid9' do
      expect(email.load_emails.length).to be > 0
    end
    it 'check valid10' do
      expect(email.load_emails.is_a?(String)).to eq false
    end
    it 'not sends email' do
      expect(email_not_valid.send_email).to eq false
    end

    it 'delete email successful then 0' do
      expect(email.number_is_right?(0)).to eq true
    end
    it 'delete email successful' do
      expect(email.delete_email('email_to' => 'jonas.jonaitis@gmail.com',
                                'email_from' => 'jonas.jonaitis@gmail.com',
                                'title' => 'Test email',
                                'text' => 'Test email')).to eq true
    end
    it 'delete email successful 2' do
      expect(email.delete_email({})).to eq true
    end
    it 'delete email unsuccessful then 10000' do
      expect(email.number_is_right?(10_000)).to eq true
    end
    it 'delete email successful then 10' do
      expect(email.number_is_right?(10)).to eq true
    end
    it 'delete email successful then not string' do
      expect(email.number_is_right?('')).to eq false
    end
    it 'delete email successful then not float' do
      expect(email.number_is_right?(1.3)).to eq false
    end
    it 'delete email successful then not nil' do
      expect(email.number_is_right?(nil)).to eq false
    end
    it 'valid to use' do
      expect(email.check_or_array(['valid'])).to eq true
    end
    it 'not valid for empty array' do
      expect(email.check_or_array([])).to eq true
    end
    it 'not valid for zero' do
      expect(email.check_or_array(0)).to eq false
    end
    it 'not valid for nil' do
      expect(email.check_or_array(nil)).to eq false
    end
    it 'text is valid' do
      expect(email.check_or_string_valid?('test')).to eq true
    end
    it 'text is not valid 2' do
      expect(email.check_or_string_valid?(nil)).to eq false
    end
    it 'text is not valid 3' do
      expect(email.check_or_string_valid?(true)).to eq false
    end
    it 'text is not valid 4' do
      expect(email.check_or_string_valid?(false)).to eq false
    end
    it 'text is not valid 5' do
      expect(email.check_or_string_valid?([])).to eq false
    end
    it 'text is not valid 6' do
      expect(email.check_or_string_valid?({})).to eq false
    end
    it 'whole email is valid' do
      expect(email.email_valid?).to eq true
    end
    it 'whole email is not valid 2' do
      expect(email_not_valid.email_valid?).to eq false
    end
    it 'save emails valid' do
      expect(email.save_emails('email_from' => 'jonas.jonaitis@gmail.com',
                               'email_to' => 'jonas.jonaitis@gmail.com',
                               'title' => 'Test email',
                               'text' => 'Test email')).to eq false
    end
    it 'save emails valid 2' do
      expect(email_not_valid.save_emails('email_from' => 'jonas.jonaitis@gmail.com',
                               'email_to' => 'jonas.jonaitis@gmail.com',
                               'title' => 'Test email',
                               'text' => 'Test email')).to eq false
    end
  end
end
