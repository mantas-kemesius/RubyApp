# frozen_string_literal: true

require_relative './../helpers/files_handler'

# User Login controller
class LoginController
  attr_reader :username, :password, :file_name
  def initialize(file_name, username, password)
    @file_name = file_name
    @username = username
    @password = password
  end
end
