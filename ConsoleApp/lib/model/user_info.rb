# User personal info
class UserInfo
  attr_reader :name, :last_name, :role
  def initialize(user_hash)
    @name = user_hash.fetch('name')
    @last_name = user_hash.fetch('last_name')
    @role = user_hash.fetch('role_id')
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
