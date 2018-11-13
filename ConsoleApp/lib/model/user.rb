require_relative 'user_info'
# User class
class User < UserInfo
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_reader :username, :password, :email, :phone
  def initialize(username, password, name, last_name, role_id)
    super(name, last_name, role_id)
    @username = username
    @password = password
    @email = ''
    @phone = ''
  end

  def init_email_phone(email, phone)
    @email = email
    @phone = phone
  end

  def change_email(new_email)
    @email = new_email
  end

  def change_phone(new_phone)
    @phone = new_phone
  end
  # TODO: implement user_exists?
end
