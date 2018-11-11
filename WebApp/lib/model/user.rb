# frozen_string_literal: true

require_relative 'user_info'
# User class
class User < UserInfo
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_reader :email, :phone
  def initialize(name, last_name, role_id, email = '', phone = '')
    super(name, last_name, role_id)
    @email = email
    @phone = phone
  end

  def change_email(new_email)
    # @email = new_email if new_email.instance_of?(String)
    @email = new_email
  end

  def change_phone(new_phone)
    # @phone = new_phone if new_phone.instance_of?(String)
    @phone = new_phone
  end
  # TODO: implement user_exists?
end
