# User personal info
class UserInfo
  attr_reader :name, :last_name, :role
  def initialize(name, last_name, role_id)
    @name = name
    @last_name = last_name
    @role = role_id
  end

  def change_name(new_name)
    @name = new_name
  end

  def change_last_name(new_last_name)
    @last_name = new_last_name
  end

  def change_role(new_role)
    @role = new_role
  end
end
