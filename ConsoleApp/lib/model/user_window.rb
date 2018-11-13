require_relative 'user'
require_relative '../../lib/helpers/files_handler'
require 'pp'

# All users are placed here
class UserWindow
  attr_reader :users, :files_handler

  def initialize(file_path)
    @users = []
    @files_handler = FilesHandler.new(file_path)
  end

  def user_exists?(username)
    users.each do |item|
      return true if item.name.eql?(username)
    end
    false
  end

  def email_used?(email)
    if email.instance_of?(String)
      users.each do |item|
        return true if item.email.eql?(email)
      end
      false
    end
    false
  end

  def add_user(user_hash)
    users << User.new(user_hash)
  end

  def delete_user(position)
    users.delete_at(position)
  end

  # :reek:FeatureEnvy
  def save_users
    data = []
    users.each do |user|
      data[data.length] = {
        'username' => user.username, 'password' => user.password,
        'name' => user.name, 'last_name' => user.last_name,
        'role_id' => user.role, 'role' => User.role_string(user.role),
        'email' => user.email, 'phone' => user.phone
      }
      @files_handler.save_data('Users' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_users
    info = @files_handler.load_data.fetch('Users')
    info.each do |user|
      add_user(user)
    end
  end
end
