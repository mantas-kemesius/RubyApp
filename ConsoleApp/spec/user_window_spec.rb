require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe UserWindow do
  context 'when loadings' do
    let(:path_to_db) { 'fakeDatabase/testFiles/User_load.json' }
    let(:file) { FilesHandler.new(path_to_db) }
    let(:item) do
      described_class.new
    end
    let(:load) do
      item.load_users(
        'fakeDatabase/testFiles/User_load.json'
      )
    end
    let(:cur_user) do
      User.new('Tomas', 'pavard', 'user', 'em@mail', '855')
    end
    let(:cur_user_temp) do
      User.new('Jonas', 'pavard', 'user', 'em@mail', '855')
    end
    let(:add) do
      item.add_user(cur_user)
      item.add_user(cur_user_temp)
      item.save_users(
        'fakeDatabase/testFiles/Users_save.json'
      )
      item.delete_user(0)
      item.delete_user(0)
      item.load_users(
        'fakeDatabase/testFiles/Users_save.json'
      )
    end

    it 'same object' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1]).to eq cur_user
      item.delete_user(0)
    end

    it 'added successful to list' do
      item.add_user(cur_user)
      expect(item.users).not_to be_empty
    end

    it 'list size increased' do
      expect do
        item.add_user(
          cur_user
        )
      end.to change { item.users.length }.by(1)
    end
    it 'single item deleted' do
      item.add_user(cur_user)
      item.delete_user(0)
      expect(item.users[0]).to eq nil
    end
    it 'add with current s_id' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1].name).to eq 'Tomas'
    end
    it 'add with current group' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1].last_name).to eq 'pavard'
    end
    it 'add with current role' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1].role).to eq 'user'
    end
    it 'add with current email' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1].email).to eq 'em@mail'
    end
    it 'add with current phone' do
      item.add_user(cur_user)
      expect(item.users[
                 item.users.length - 1].phone).to eq '855'
    end
    it 'first item name correct' do
      load
      expect(item.users[0].name).to eq 'Tomas'
    end
    it 'first last name correct' do
      load
      expect(item.users[0].last_name).to eq 'Pavard'
    end
    it 'first item role_id correct' do
      load
      expect(item.users[0].role).to eq 'user'
    end
    it 'first item email correct' do
      load
      expect(item.users[0].email).to eq 'em@mail'
    end
    it 'first item phone correct' do
      load
      expect(item.users[0].phone).to eq '5'
    end
    it 'can save/load name' do
      cur_user.change_name('Jonas')
      add
      expect(item.users[0].name).to eq 'Jonas'
    end
    it 'can save/load last_name' do
      cur_user.change_last_name('Pavarde')
      add
      expect(item.users[0].last_name).to eq 'Pavarde'
    end
    it 'can save/load role' do
      cur_user.change_role('admin')
      add
      expect(item.users[0].role).to eq 'admin'
    end
    it 'can save/load email' do
      cur_user.change_email('m@ail')
      add
      expect(item.users[0].email).to eq 'm@ail'
    end
    it 'can save/load phone' do
      cur_user.change_phone('866')
      add
      expect(item.users[0].phone).to eq '866'
    end
  end
end
