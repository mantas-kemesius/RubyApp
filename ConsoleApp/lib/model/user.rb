require_relative 'user_info'
# User class
class User < UserInfo
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_reader :username, :password, :email, :phone
  def initialize(user_hash)
    super(user_hash)
    @username = user_hash.fetch('username')
    @password = user_hash.fetch('password')
    @email = user_hash.fetch('email')
    @phone = user_hash.fetch('phone')
  end

  def return_user_hash
    {
      'username' => username,
      'password' => password,
      'name' => name,
      'last_name' => last_name,
      'role_id' => role,
      'role' => User.role_string(role),
      'email' => email,
      'phone' => phone
    }
  end

  def change_name(new_name)
    @name = new_name
  end

  def change_last_name(new_last_name)
    @last_name = new_last_name
  end

  def change_password(new_password)
    @password = new_password
  end

  def change_email(new_email)
    @email = new_email
  end

  def change_phone(new_phone)
    @phone = new_phone
  end

  def self.role_string(role_id)
    ROLE.at(role_id)
  end
end
