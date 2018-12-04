# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Mail, type: :model do
  fixtures :mails
  context 'when created' do
    it 'has none to begin with' do
      expect(Mail.count).to eq mails.size
    end
    it 'has one after adding one' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      Mail.create!(to: user1.id, from: user2.id, title: '8:00', message: 'L')
      expect(Mail.count).to eq mails.size + 1
    end
    it 'is in database' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to: user1.id, from: user2.id, title: '8', message: 'L')

      expect(Mail.find(em.id)).to be_present
    end
    it 'changed to is in database' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to: user1.id, from: user2.id, title: '8', message: 'L')
      Mail.update_to_emails(user2.id)
      expect(Mail.find(em.id).to).to eq user2.id
    end
    it 'changed from is in database' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to: user1.id, from: user2.id, title: '8', message: 'L')
      Mail.update_from_emails(user1.id)
      expect(Mail.find(em.id).from).to eq user1.id
    end
    it 'changed title is in database' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to: user1.id, from: user2.id, title: '8', message: 'L')
      Mail.update_title('naujas')

      expect(Mail.find(em.id).title).to eq 'naujas'
    end
    it 'changed message is in database' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)
      em = Mail.create!(to: user1.id, from: user2.id, title: '7', message: 'L')
      Mail.update_message('naujas2')

      expect(Mail.find(em.id).message).to eq 'naujas2'
    end

    it 'added successfully' do
      user1 = User.create!(email: 'asd2', age: 1)
      user2 = User.create!(email: 'asd', age: 2)

      Mail.add(user1.id, user2.id, 'a', 't')
      bo = Mail.exists?(from: user1.id, to: user2.id, title: 'a', message: 't')
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

      Mail.del(mail.from)
      expect(Mail.exists?(mail.id)).to be false
    end
  end
end
