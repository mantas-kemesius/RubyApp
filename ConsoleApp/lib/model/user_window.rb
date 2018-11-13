require_relative 'user'
require_relative '../../lib/helpers/files_handler'
require 'pp'

# All users are placed here
class UserWindow
  attr_reader :users

  def initialize
    @users = []
  end

  def user_exists?(name)
    users.each do |item|
      return true if item.name.eql?(name)
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

  def add_user(user, email, phone)
    user.init_email_phone(email, phone)
    users << user
  end

  def delete_user(position)
    users.delete_at(position)
  end

  # :reek:FeatureEnvy
  def save_users(path)
    file = FilesHandler.new(path)
    data = []
    users.each do |user|
      data[data.length] = {
        'username' => user.username, 'password' => user.password,
        'name' => user.name, 'last_name' => user.last_name,
        'role' => user.role, 'email' => user.email, 'phone' => user.phone
      }
      file.save_data('Users' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_users(path)
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Users')
    info.each do |user|
      add_user(User.new(user.fetch('username'),
                        user.fetch('password'),
                        user.fetch('name'),
                        user.fetch('last_name'),
                        user.fetch('role')),
               user.fetch('email'), user.fetch('phone'))
    end
  end
end
