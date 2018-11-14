require 'spec_helper'

RSpec.describe(EmailWindow) do
  context 'when email is added by object' do
    let(:window) do
      described_class.new('../fakeDatabase/Emails.json')
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
      described_class.new('../fakeDatabase/Emails.json')
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

  context 'with delete' do
    let(:window) do
      described_class.new('../fakeDatabase/Emails.json')
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
    let(:item2) do
      Email.new(
        'date' => '2018-11-12',
        'email_to' => 'petras.jonaitis@gmail.com',
        'email_from' => 'jonas.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end
    let(:item3) do
      Email.new(
        'date' => '2018-11-13',
        'email_to' => 'jonas.petraitis@gmail.com',
        'email_from' => 'petras.petraitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end

    it 'single item deleted by position' do
      window.add_email_by_obj(item)
      window.delete_email(0)
      expect(window.emails[0]).to eq nil
    end
    it 'delete all' do
      window.add_email_by_obj(item)
      window.add_email_by_obj(item2)
      window.delete_all
      expect(window.emails[0]).to eq nil
    end
  end

  context 'with load' do
    let(:window) do
      described_class.new('../fakeDatabase/Emails.json')
    end

    let(:load) do
      window.load_emails
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

    it 'second item username correct' do
      load
      expect(window.emails[1].email_to).to eq 's112'
    end
    it 'second item university correct' do
      load
      expect(window.emails[1].email_from).to eq 'e@gmail'
    end
    it 'second item faculty correct' do
      load
      expect(window.emails[1].title).to eq 'newTitl'
    end
    it 'delete before load' do
      window.add_email(item)
      load
      expect(window.emails[0].text).to eq 'text'
    end
  end

  context 'when to file' do
    let(:window) do
      described_class.new('../fakeDatabase/testFiles/Emails_save.json')
    end

    let(:path_to_db) { 'fakeDatabase/testFiles/Emails_save.json' }
    let(:item) do
      Email.new('t1610179', 'Vilniaus universitetas', 'mif', 'ka')
    end
    let(:item2) do
      Email.new('t1610180', 'Vu', 'mif', 'ka')
    end
    let(:add) do
      window.add_email(item)
      window.add_email(item2)
      window.save_emails(
        'fakeDatabase/testFiles/Emails_save.json'
      )
      window.delete_email(0)
      window.delete_email(0)
      window.load_emails(
        'fakeDatabase/testFiles/Emails_save.json'
      )
    end

    it 'username correct' do
      item2.change_email_to('t1610197')
      add
      expect(window.emails[1].email_to).to eq 't1610197'
    end
    it 'university correct' do
      item2.change_email_from('VGTU')
      add
      expect(window.emails[1].email_from).to eq 'VGTU'
    end
    it 'title correct' do
      item2.change_title('vf')
      add
      expect(window.emails[1].title).to eq 'vf'
    end
    it 'text correct' do
      item2.change_title('vf')
      add
      expect(window.emails[1].text).to eq 'ka'
    end
  end

  context 'when append' do
    let(:window) do
      described_class.new('../fakeDatabase/Emails.json')
    end

    let(:item) do
      Email.new('t1610179', 'Vilniaus universitetas', 'mif', 'ka')
    end
    let(:item2) do
      Email.new('t1610180', 'Vilniaus universitetas', 'mif', 'ka')
    end

    let(:save_item) do
      window.add_email(item)
      window.save_emails(
        'fakeDatabase/testFiles/Emails_append.json'
      )
      window.delete_email(0)
    end
    let(:load) do
      window.load_emails(
        'fakeDatabase/testFiles/Emails_append.json'
      )
    end
    let(:append) do
      window.append_email(item2,
                          'fakeDatabase/testFiles/Emails_append.json')
    end

    it 'appended new item' do
      save_item
      append
      load
      expect(window.emails[1].email_to).to eq 't1610180'
    end
    it 'appended changed value' do
      item2.change_email_from('t1610181')
      save_item
      append
      load
      expect(window.emails[1].email_to).to eq 't1610180'
    end
    it 'without adding' do
      save_item
      expect(window.emails[1]).to eq nil
    end
  end
end
