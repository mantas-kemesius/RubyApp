require_relative './../helpers/files_handler'

# User Login controller
class LoginController
  attr_accessor :user_obj
  def initialize
    @file_handler = FilesHandler.new
  end

  def login?(username, password, file_name = 'Users')
    users = @file_handler.load_data(file_name)
    users['Users'].each do |item|
      next unless item['username'] == username && item['password'] == password
      serializer(item)
      return true
    end
    false
  end

  def serializer(user)
    @user_obj = User.new(
      user['name'],
      user['lastName'],
      user['role_id'],
      user['email'],
      user['phone']
    )
  end
end
