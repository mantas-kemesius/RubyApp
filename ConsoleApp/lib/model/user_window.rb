require_relative '../../lib/helpers/files_handler'
require_relative '../../lib/model/user'
require 'pp'

# All users are placed here
class UserWindow
  attr_reader :users, :files_handler

  def initialize(file_path)
    @users = []
    @files_handler = FilesHandler.new(file_path)
  end

  def user_by_username(username)
    users.each_with_index do |item, index|
      return users.fetch(index) if item.username.eql?(username)
    end
    nil
  end

  def user_exists?(username)
    users.each do |item|
      return true if item.username.eql?(username)
    end
    false
  end

  def email_used?(email)
    users.each do |item|
      return true if item.email.eql?(email)
    end
    false
  end

  def add_user_by_obj(user)
    users << user
  end

  def add_user_by_hash(user_hash)
    users << User.new(user_hash)
  end

  def delete_user(position)
    users.delete_at(position)
  end

  def delete_users
    @users = []
  end

  # :reek:FeatureEnvy
  def save_users
    data = []
    users.each do |user|
      # user_role = user.role
      data[data.length] = user.return_user_hash
    end
    files_handler.save_data('Users' => data)
  end

  # :reek:FeatureEnvy
  def load_users
    delete_users
    info = files_handler.load_data
    return unless info.key?('Users')

    info.fetch('Users').each do |user|
      add_user_by_hash(user)
    end
  end
end
