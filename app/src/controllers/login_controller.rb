require_relative './../helpers/files_handler'

class LoginController

  def initialize
    @file_handler = FilesHandler.new
  end

  def login?(username, password, file_name = 'Users')
    users = @file_handler.load_data(file_name)
    users['Users'].each do |item|
      if item['username'] == username && item['password'] == password
        return true
      end
    end
    false
  end

end