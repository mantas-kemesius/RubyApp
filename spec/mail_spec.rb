# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Mail, type: :model do
  fixtures :mails
  context 'when created' do
    it 'has none to begin with' do
      expect(Mail.count).to eq mails.size
    end
    it 'has one after adding one' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')
      expect(Mail.count).to eq mails.size + 1
    end
    it 'is in database' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')

      expect(Mail.find(em.id)).to be_present
    end
    it 'changed to is in database' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')
      Mail.update_to_emails(u2.id)
      expect(Mail.find(em.id).to_id).to eq u2.id
    end
    it 'changed from is in database' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')
      Mail.update_from_emails(u1.id)
      expect(Mail.find(em.id).from_id).to eq u1.id
    end
    it 'changed title is in database' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')
      Mail.update_title('naujas')

      expect(Mail.find(em.id).title).to eq 'naujas'
    end
    it 'changed message is in database' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to_id: u1.id, from_id: u2.id, title: '8', message: 'L')
      Mail.update_message('naujas2')

      expect(Mail.find(em.id).message).to eq 'naujas2'
    end

    it 'added successfully' do
      u1 = User.create!(email: 'asd2', age: 1)
      u2 = User.create!(email: 'asd', age: 2)

      Mail.add(u1.id, u2.id, 'a', 't')
      bo = Mail.exists?(from_id: u1.id, to_id: u2.id, title: 'a', message: 't')
      expect(bo).to be true
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Mail.count).to eq mails.size
    end
    it 'count decreases' do
      mail = mails(:Tomas)
      mail.destroy
      expect(Mail.count).to eq mails.size - 1
    end
    it 'deleted item does not exist' do
      mail = mails(:Antanas)
      mail.destroy
      expect(Mail.exists?(mail.id)).to be false
    end
    it 'deletes item by user' do
      mail = mails(:Bronius)

      Mail.del(mail.from_id)
      expect(Mail.exists?(mail.id)).to be false
    end
  end
end
