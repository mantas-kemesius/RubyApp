require 'spec_helper'

RSpec.describe(EmailWindow) do
  context 'when email is added by object' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Emails_add.json')
    end

    let(:email_obj) do
      Email.new(
        'date' => '2018-11-13',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end

    it 'the same email object appears at the end of email list' do
      window.add_email_by_obj(email_obj)
      expect(window.emails[
                 window.emails.length - 1]).to eq email_obj
      window.delete_email(0)
    end

    it 'email list is appended successfully' do
      window.add_email_by_obj(email_obj)
      expect(window.emails).not_to be_empty
      window.delete_email(0)
    end

    it 'email list size is increased' do
      expect do
        window.add_email_by_obj(email_obj)
      end.to change { window.emails.length }.by(1)
      window.delete_email(0)
    end
  end

  context 'when email is added by hash' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Emails_add.json')
    end

    let(:email_hash) do
      {
        'date' => '2018-11-13',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      }
    end

    it 'the same email object appears at the end of email list' do
      window.add_email_by_hash(email_hash)
      expect(window.emails[
                 window.emails.length - 1].return_email).to eq email_hash
      window.delete_email(0)
    end

    it 'email list is appended successfully' do
      window.add_email_by_hash(email_hash)
      expect(window.emails).not_to be_empty
      window.delete_email(0)
    end

    it 'email list size is increased' do
      expect do
        window.add_email_by_hash(email_hash)
      end.to change { window.emails.length }.by(1)
      window.delete_email(0)
    end
  end

  context 'when deleting email' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Emails_add.json')
    end

    let(:item) do
      Email.new(
        'date' => '2018-11-11',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end

    it 'single item is deleted by position successfully' do
      window.add_email_by_obj(item)
      window.delete_email(0)
      expect(window.emails[0]).to eq nil
    end
  end

  context 'when emails loaded' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Emails_load.json')
    end

    let(:load) do
      window.load_emails
    end

    let(:item1) do
      Email.new(
        'date' => '2018-11-11',
        'email_to' => 'petras.jonaitis@gmail.com',
        'email_from' => 'jonas.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end

    let(:item2) do
      Email.new(
        'date' => '2018-11-11',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title2',
        'text' => 'Test text2'
      )
    end

    it 'first item has correct date' do
      load
      expect(window.emails[0].date).to eq item1.date
    end
    it 'first item has correct email_to' do
      load
      expect(window.emails[0].email_to).to eq item1.email_to
    end
    it 'first item has correct email_from' do
      load
      expect(window.emails[0].email_from).to eq item1.email_from
    end
    it 'first item has correct title' do
      load
      expect(window.emails[0].title).to eq item1.title
    end
    it 'first item has correct text' do
      load
      expect(window.emails[0].text).to eq item1.text
    end
    it 'second item has correct date' do
      load
      expect(window.emails[1].date).to eq item2.date
    end
    it 'second item has correct email_to' do
      load
      expect(window.emails[1].email_to).to eq item2.email_to
    end
    it 'second item has correct email_from' do
      load
      expect(window.emails[1].email_from).to eq item2.email_from
    end
    it 'second item has correct title' do
      load
      expect(window.emails[1].title).to eq item2.title
    end
    it 'second item has correct text' do
      load
      expect(window.emails[1].text).to eq item2.text
    end
    it 'EmailWindow object email array is cleared before loading' do
      window.add_email_by_obj(item1)
      load
      expect(window.emails.size).to eq 2
    end
  end

  context 'when saving emails to file' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Emails_save.json')
    end

    let(:item1) do
      Email.new(
        'date' => '2018-11-11',
        'email_to' => 'petras.jonaitis@gmail.com',
        'email_from' => 'jonas.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end

    let(:item2) do
      Email.new(
        'date' => '2018-11-11',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title2',
        'text' => 'Test text2'
      )
    end

    let(:add) do
      window.add_email_by_obj(item1)
      window.add_email_by_obj(item2)
      window.save_emails
      window.load_emails
    end

    it 'first item date is correct' do
      add
      expect(window.emails[0].date).to eq item1.date
    end
    it 'first item email_to is correct' do
      add
      expect(window.emails[0].email_to).to eq item1.email_to
    end
    it 'first item email_from is correct' do
      add
      expect(window.emails[0].email_from).to eq item1.email_from
    end
    it 'first item email_title is correct' do
      add
      expect(window.emails[0].title).to eq item1.title
    end
    it 'first item email_text is correct' do
      add
      expect(window.emails[0].text).to eq item1.text
    end
    it 'second item date is correct' do
      add
      expect(window.emails[1].date).to eq item2.date
    end
    it 'second item email_to is correct' do
      add
      expect(window.emails[1].email_to).to eq item2.email_to
    end
    it 'second item email_from is correct' do
      add
      expect(window.emails[1].email_from).to eq item2.email_from
    end
    it 'second item email_title is correct' do
      add
      expect(window.emails[1].title).to eq item2.title
    end
    it 'second item email_text is correct' do
      add
      expect(window.emails[1].text).to eq item2.text
    end
  end
end
