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
    # @email = email  //added email validation above
    # !!!
    @phone = phone
  end

  def get_name
    @name
  end

  def set_name (name)
    @name = name
  end

  def get_last_name
    @last_name
  end

  def set_last_name (last_name)
    @last_name = last_name
  end

  def get_role_id
    @role
  end

  def set_role_id (role_id)
    @role = ROLE[role_id]
  end

  def get_email
    @email
  end

  def set_email (email)
    @email = email
  end

  def get_phone
    @phone
  end

  def set_phone (phone)
    @phone = phone
  end

end
