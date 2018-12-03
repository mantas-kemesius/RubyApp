# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe User, type: :model do
  fixtures :users
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
      User.update_name('two')
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
end
