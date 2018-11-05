require 'spec_helper'
require_relative '../lib/helpers/files_handler'

describe Email do
  context 'initial data ' do
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

    let(:temp_email) do
      {
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      }
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
    it 'return full email' do
      expect(email.return_email).to eq temp_email
    end
    it 'change succesful to' do
      email_not_valid.change_email_to('Naujas email_to')
      expect(email_not_valid.email_to).to eq 'Naujas email_to'
    end
    it 'change succesful from' do
      email_not_valid.change_email_from('Naujas email_from')
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
      email.change_email_to(1)
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'change unsuccesful from' do
      email.change_email_from(2)
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
  end
end
