require_relative './../helpers/files_handler'

# User Login controller
class LoginController
  attr_reader :username, :password
  def initialize
    @file_handler = FilesHandler.new
  end

  def login?(username, password, file_name = 'Users')
    # temp_username = username
    # temp_password = password
    users = @file_handler.load_data(file_name)

    iterate_users(users, username, password)
  end

  def iterate_users(users, username, password)
    temp_username = username
    temp_password = password
    users['Users'].each do |item|
      next unless item['username'] == temp_username &&
                  item['password'] == temp_password

      return true
    end
    false
  end
end
