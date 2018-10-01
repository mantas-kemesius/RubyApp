require_relative './../helpers/files_handler'

class LoginController
  attr_accessor :user
  def initialize
    @file_handler = FilesHandler.new
  end

  def login?(username, password, file_name = 'Users')
    users = @file_handler.load_data(file_name)
    users['Users'].each do |item|
      next unless item['username'] == username && item['password'] == password
      @user = User.new(
        item['name'],
        item['lastName'],
        item['role_id'],
        item['email'],
        item['phone']
      )
      return true
    end
    false
  end
end
