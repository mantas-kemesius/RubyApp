require_relative 'user_info'
# User class
class User < UserInfo
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_reader :username, :password, :email, :phone
  def initialize(user_hash)
    super(user_hash.fetch('name'),
          user_hash.fetch('last_name'),
          user_hash.fetch('role_id'))
    @username = user_hash.fetch('username')
    @password = user_hash.fetch('password')
    @email = user_hash.fetch('email')
    @phone = user_hash.fetch('phone')
  end

  def change_email(new_email)
    @email = new_email
  end

  def change_phone(new_phone)
    @phone = new_phone
  end

  def self.role_string(role_id)
    ROLE[role_id]
    # if role_id.zero?
    #   'ROLE_STUDENT'
    # elsif role_id == 1
    #   'ROLE_TEACHER'
    # end
  end
end
