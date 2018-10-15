require_relative './../helpers/files_handler'

# User Login controller
class LoginController
  attr_reader :username, :password, :file_name
  def initialize(file_name, username, password)
    @file_name = file_name
    @username = username
    @password = password
    # @file_handler = FilesHandler.new(file_name)
  end

  # def login?
  #   # temp_username = username
  #   # temp_password = password
  #   users = @file_handler.load_data
  #   users['Users'].each do |item|
  #     next unless item['username'] == @username &&
  #                 item['password'] == @password
  #
  #     return true
  #   end
  #     false
  #   else
  #     false
  #   end
  #
  # end
end
