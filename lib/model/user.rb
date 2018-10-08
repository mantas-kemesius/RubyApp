class User
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_accessor :name, :last_name, :role, :email, :phone
  def initialize(name, last_name, role_id, email = '', phone = '')
    @name = name
    @last_name = last_name
    @role = ROLE[role_id]
    @email = if Email.a_valid_email?(email)
               email
             else
               ''
             end
    @phone = phone
  end
end
