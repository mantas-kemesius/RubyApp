require_relative './../helpers/files_handler'

# User Login controller
class LoginController
  attr_reader :username, :password
  def initialize
    @file_handler = FilesHandler.new
  end

  def login?(username, password, file_name = 'Users')
    users = @file_handler.load_data(file_name)
    users['Users'].each do |item|
      next unless item['username'] == username && item['password'] == password
      return true
    end
    false
  end

end
