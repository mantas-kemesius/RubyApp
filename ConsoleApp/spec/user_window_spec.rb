require 'spec_helper'

describe UserWindow do
  context 'when user is added by object' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_add.json')
    end

    let(:user) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    it 'the same email object appears at the end of email list' do
      window.add_user_by_obj(user)
      expect(window.users[
                 window.users.length - 1].return_user_hash)
        .to eq user.return_user_hash
      window.delete_user(0)
    end

    it 'email list is appended successfully' do
      window.add_user_by_obj(user)
      expect(window.users).not_to be_empty
      window.delete_user(0)
    end

    it 'email list size is increased' do
      expect do
        window.add_user_by_obj(user)
      end.to change { window.users.length }.by(1)
      window.delete_user(0)
    end
  end

  context 'when user is added by hash' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_add.json')
    end

    let(:user_hash) do
      {
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'role' => 'ROLE_STUDENT',
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      }
    end

    it 'the same email object appears at the end of email list' do
      window.add_user_by_hash(user_hash)
      expect(window.users[
                 window.users.length - 1].return_user_hash).to eq user_hash
      window.delete_user(0)
    end

    it 'email list is appended successfully' do
      window.add_user_by_hash(user_hash)
      expect(window.users).not_to be_empty
      window.delete_user(0)
    end

    it 'email list size is increased' do
      expect do
        window.add_user_by_hash(user_hash)
      end.to change { window.users.length }.by(1)
      window.delete_user(0)
    end
  end

  context 'when deleting user' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_add.json')
    end

    let(:item) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    it 'single item is deleted by position successfully' do
      window.add_user_by_obj(item)
      window.delete_user(0)
      expect(window.users[0]).to eq nil
    end
  end

  context 'when emails loaded' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_load.json')
    end

    let(:empty_window) do
      described_class.new('fakeDatabase/testFiles/Users_empty.json')
    end

    let(:load) do
      window.load_users
    end

    let(:load_empty) do
      empty_window.load_users
    end

    let(:item1) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:item2) do
      User.new(
        'username' => 'TomasMacikas',
        'password' => 'slaptazodis',
        'name' => 'Tomas',
        'last_name' => 'Macikas',
        'role_id' => 1,
        'email' => 'macikastomas@gmail.com',
        'phone' => '+37062274996'
      )
    end

    it 'empty user array on loading file with no users' do
      load_empty
      expect(empty_window.users.size).to eq 0
    end

    it 'first user was loaded successfully' do
      load
      expect(window.users[0].return_user_hash).to eq(item1.return_user_hash)
    end

    it 'second user was loaded successfully' do
      load
      expect(window.users[1].return_user_hash).to eq(item2.return_user_hash)
    end

    it 'UserWindow object user array is cleared before loading' do
      window.add_user_by_obj(item1)
      load
      expect(window.users.size).to eq 2
    end
  end

  context 'when deleting all users in array' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_save.json')
    end

    let(:item1) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:item2) do
      User.new(
        'username' => 'TomasMacikas',
        'password' => 'slaptazodis',
        'name' => 'Tomas',
        'last_name' => 'Macikas',
        'role_id' => 1,
        'email' => 'macikastomas@gmail.com',
        'phone' => '+37062274996'
      )
    end

    let(:add) do
      window.add_user_by_obj(item1)
      window.add_user_by_obj(item2)
    end

    let(:delete) do
      window.delete_users
    end

    it 'user array is empty after deletion' do
      add
      delete
      expect(window.users.size).to eq 0
    end
  end

  context 'when saving emails to file' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_save.json')
    end

    let(:item1) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:item2) do
      User.new(
        'username' => 'TomasMacikas',
        'password' => 'slaptazodis',
        'name' => 'Tomas',
        'last_name' => 'Macikas',
        'role_id' => 1,
        'email' => 'macikastomas@gmail.com',
        'phone' => '+37062274996'
      )
    end

    let(:add) do
      window.add_user_by_obj(item1)
      window.add_user_by_obj(item2)
    end

    let(:load) do
      window.load_users
    end

    let(:save) do
      window.save_users
    end

    let(:delete_users) do
      window.delete_users
      window.save_users
    end

    it 'file is not empty after save' do
      add
      save
      load
      expect(window.users).not_to be_empty
      delete_users
    end

    # it ''
    # expect do
    #   window.add_user_by_obj(user)
    # end.to change { window.users.length }.by(1)
    # window.delete_user(0)

    it 'first item is saved successfully' do
      add
      save
      load
      expect(window.users[0].return_user_hash).to eq item1.return_user_hash
      delete_users
    end

    it 'second item is saved successfully' do
      add
      save
      load
      expect(window.users[1].return_user_hash).to eq item2.return_user_hash
      delete_users
    end
  end

  context 'when checking if username is used' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_search.json')
    end

    let(:user1) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:user2) do
      User.new(
        'username' => 'TomasMacikas',
        'password' => 'slaptazodis',
        'name' => 'Tomas',
        'last_name' => 'Macikas',
        'role_id' => 1,
        'email' => 'macikastomas@gmail.com',
        'phone' => '+37062274996'
      )
    end

    let(:add) do
      window.add_user_by_obj(user1)
      window.add_user_by_obj(user2)
      window.save_users
      window.load_users
    end

    it 'first username was found successfully (is used)' do
      add
      expect(window.user_exists?(user1.username)).to eq true
    end

    it 'second username was found successfully (is used)' do
      add
      expect(window.user_exists?(user2.username)).to eq true
    end

    it 'username was not found (is not used)' do
      add
      expect(window.user_exists?('non-existent-username')).not_to eq true
    end

    it 'not searching. Non-string argument given' do
      add
      expect(window.user_exists?(2)).to eq false
    end
  end

  context 'when checking if email is used' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_search.json')
    end

    let(:user1) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:user2) do
      User.new(
        'username' => 'TomasMacikas',
        'password' => 'slaptazodis',
        'name' => 'Tomas',
        'last_name' => 'Macikas',
        'role_id' => 1,
        'email' => 'macikastomas@gmail.com',
        'phone' => '+37062274996'
      )
    end

    let(:add) do
      window.add_user_by_obj(user1)
      window.add_user_by_obj(user2)
      window.save_users
      window.load_users
    end

    it 'first email was found successfully (is used)' do
      add
      expect(window.email_used?(user1.email)).to eq true
    end

    it 'second email was found successfully (is used)' do
      add
      expect(window.email_used?(user2.email)).to eq true
    end

    it 'email was not found (is not used)' do
      add
      expect(window.email_used?('non-existent-email')).to eq false
    end

    it 'not searching. Non-string argument given' do
      add
      expect(window.email_used?(2)).to eq false
    end
  end

  context 'when searching for teacher by username' do
    let(:window) do
      described_class.new('fakeDatabase/testFiles/Users_load.json')
    end

    let(:user) do
      User.new(
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      )
    end

    let(:load) do
      window.load_users
    end

    it 'search is successful' do
      load
      found_user = window.user_by_username('arnasrad')
      expect(found_user.username).to eq user.username
    end

    it 'search is unsuccessful' do
      load
      found_user = window.user_by_username('s184923')
      expect(found_user).to eq nil
    end
  end
end
