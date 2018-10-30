require 'spec_helper'
require_relative '../lib/helpers/files_handler'

describe Email do
  context 'initial data ' do
    let(:path_to_db) { 'fakeDatabase/testFiles/Emails.json' }
    let(:email) do
      described_class.new(
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end
    let(:email_not_valid) do
      described_class.new(
        'email_to' => 1,
        'email_from' => 2,
        'title' => 3,
        'text' => 4
      )
    end

    it 'succesful to' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'succesful from' do
      expect(email.email_from).to eq 'petras.jonaitis@gmail.com'
    end
    it 'succesful text' do
      expect(email.title).to eq 'Test title'
    end
    it 'succesful title' do
      expect(email.text).to eq 'Test text'
    end

    it 'unsuccesful to' do
      expect(email_not_valid.email_to).to eq nil
    end
    it 'unsuccesful from' do
      expect(email_not_valid.email_from).to eq nil
    end
    it 'unsuccesful text' do
      expect(email_not_valid.title).to eq nil
    end
    it 'unsuccesful title' do
      expect(email_not_valid.text).to eq nil
    end

    it 'change succesful to' do
      email_not_valid.change_emails_to('Naujas email_to')
      expect(email_not_valid.email_to).to eq 'Naujas email_to'
    end
    it 'change succesful from' do
      email_not_valid.change_emails_from('Naujas email_from')
      expect(email_not_valid.email_from).to eq 'Naujas email_from'
    end
    it 'change succesful title' do
      email_not_valid.change_title('Naujas title')
      expect(email_not_valid.title).to eq 'Naujas title'
    end
    it 'change succesful text' do
      email_not_valid.change_text('Naujas text')
      expect(email_not_valid.text).to eq 'Naujas text'
    end

    it 'change unsuccesful to' do
      email.change_emails_to(1)
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'change unsuccesful from' do
      email.change_emails_from(2)
      expect(email.email_from).to eq 'petras.jonaitis@gmail.com'
    end
    it 'change unsuccesful title' do
      email.change_title(3)
      expect(email.title).to eq 'Test title'
    end
    it 'change unsuccesful text' do
      email.change_text(4)
      expect(email.text).to eq 'Test text'
    end

    it 'save/change/load succesful to' do
      email.save_email(path_to_db)
      email.change_emails_to('blogas email_to')
      email.load_email(path_to_db)
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
      email.delete_email_file(path_to_db)
    end
    it 'save/change/load succesful from' do
      email.save_email(path_to_db)
      email.change_emails_from('blogas email_from')
      email.load_email(path_to_db)
      expect(email.email_from).to eq 'petras.jonaitis@gmail.com'
      email.delete_email_file(path_to_db)
    end
    it 'save/change/load succesful title' do
      email.save_email(path_to_db)
      email.change_title('blogas title')
      email.load_email(path_to_db)
      expect(email.title).to eq 'Test title'
      email.delete_email_file(path_to_db)
    end
    it 'save/change/load succesful text' do
      email.save_email(path_to_db)
      email.change_text('blogas text')
      email.load_email(path_to_db)
      expect(email.text).to eq 'Test text'
      email.delete_email_file(path_to_db)
    end

    it 'deletefile' do
      email.save_email(path_to_db)
      expect(email.delete_email_file(path_to_db)).to eq true
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
    it 'not valid for string' do
      expect(email.check_or_array('')).to eq false
    end
    it 'not valid for bool' do
      expect(email.check_or_array(true)).to eq false
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
  end
end
