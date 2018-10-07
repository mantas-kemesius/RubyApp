class User
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_accessor :name, :last_name, :role, :email, :phone
  def initialize(name, last_name, role_id, email = '', phone = '')
    @name = name
    @last_name = last_name
    @role = ROLE[role_id]
    @email = email
    @phone = phone
  end

  def getName
    return @name
  end

  def setName (name)
    @name = name
  end

  def getLastName
    return @last_name
  end

  def setLastName (last_name)
    @last_name = last_name
  end

  def getRoleID
    return @role
  end

  def setRoleID (role_id)
    @role = ROLE[role_id]
  end

  def getEmail
    return @email
  end

  def setEmail (email)
    @email = email
  end

  def getPhone
    return @phone
  end

  def setPhone (phone)
    @phone = phone
  end

end
