# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe User, type: :model do
  fixtures :users, :mails
  context 'when checking fixtures' do
    it 'first object loaded' do
      users(:Tomas)
      expect(users(:Tomas).name).to eq('Tomas')
    end
  end

  context 'when created' do
    it 'has none to begin with' do
      expect(User.count).to eq users.size
    end
    it 'has one after adding one' do
      User.create!(age: 1)
      expect(User.count).to eq users.size + 1
    end
    it 'created successfully' do
      user = described_class.new(name: 'Tom', last_name: 'Mac')
      expect(user).to have_attributes(name: 'Tom', last_name: 'Mac')
    end
    it 'is in database' do
      user = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
      expect(User.find(user.id)).to be_present
    end
    it 'added successfully' do
      User.add('Tom', 'Mac', 'Testas', '123', 22)
      expect(User.exists?(name: 'Tom', last_name: 'Mac', age: 22,
                          password: '123', email: 'Testas')).to be true
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(User.count).to eq users.size
    end
    it 'count decreases' do
      user = users(:Tomas)
      user.destroy
      expect(User.count).to eq users.size - 1
    end
    it 'deletes user by id' do
      user = users(:Tomas)
      User.del(user.id)
      expect(User.exists?(user.id)).to be false
    end
  end

  context 'when changing' do
    it 'can change name' do
      user = User.create!(name: 'one', age: 15)
      allow(user).to receive(:is_name_long_enough).and_return(true)
      user.update_name('two')
      expect(User.find(user.id).name).to eq 'two'
    end
    it 'can change last_name' do
      user = User.create!(last_name: 'one', age: 15)
      User.update_last_name('two')
      expect(User.find(user.id).last_name).to eq 'two'
    end
    it 'can change password' do
      user = User.create!(password: 'one', age: 15)
      User.update_password('two')
      expect(User.find(user.id).password).to eq 'two'
    end
    it 'can change age' do
      user = User.create!(age: 15)
      User.update_age(22)
      expect(User.find(user.id).age).to eq 22
    end
  end

  context 'when send_email' do
    let(:u1) do
      User.create!(email: 'qwer', age: 1)
    end

    let(:u2) do
      instance_double('User', id: 222) # mock
    end

    let(:u3) do
      instance_double('User', id: 333) # mock
    end

    let(:u4) do
      User.create!(email: 'asdf', age: 5)
    end

    let(:send_to_u2) do
      u1.send_email(u2.id, 'Title', 'text')
    end

    let(:send_to_u4) do
      u1.send_email(u4.id, 'Title', 'text')
    end

    it 'email fixture count is same as database mail count before delete' do
      expect(Mail.count).to eq mails.size
    end

    it 'mail count does not change if send was unsuccessful' do
      u1.send_email(nil, 'title', 'text')
      expect(Mail.count).to eq mails.size
    end

    it 'mail does not exist in database before sending' do
      puts u4.id
      expect(Mail.where(from_id: u1.id, to_id: u2.id).exists?).to be false
    end

    it 'creates new mail' do
      allow(User).to receive(:exists?).and_return(true) # stub method
      send_to_u2
      expect(Mail.where(from_id: u1.id, to_id: u2.id,
                        title: 'Title', message: 'text').exists?).to be true
    end

    it 'successfully sends a mail to user' do
      send_to_u4
      expect(Mail.where(from_id: u1.id, to_id: u4.id,
                        title: 'Title', message: 'text').exists?).to be true
    end

    it 'does not send mail if user is not found' do
      u1.send_email(u3.id, 'Title', 'text')
      expect(Mail.where(from_id: u1.id, to_id: u3.id,
                        title: 'Title', message: 'text').exists?).to be false
    end
  end

  context 'with valid data' do
    it 'password valid' do
      user = users(:Tomas)
      validator = double(:validator)
      allow(validator).to receive(:valid?).and_return(true)
      expect(user.check_password(user.password, validator)).to eq('password valid')
    end

    it 'password valid with validator' do
      user = users(:Tomas)
      expect(user.check_password(user.password, user)).to eq('password valid')
    end

    it 'password valid with validator' do
      user = users(:Tomas)
      expect(user.check_password('', user)).to eq('password valid')
    end
  end

  context 'with invalid data' do
    it 'raises Error' do
      user = users(:Tomas)
      validator = double(:validator)
      allow(validator).to receive(:valid?).and_return(false)
      expect { user.check_password(' ', validator) }.to raise_error(User::Error)
    end
  end
end
