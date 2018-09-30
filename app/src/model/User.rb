class User
  ROLE = ['ROLE_STUDENT', 'ROLE_LECTURER', 'ROLE_ADMIN']
  attr_accessor :name, :last_name, :role
  def initialize(name, last_name, role_id)
    @name = name
    @last_name = last_name
    @role = ROLE[role_id]
  end

end
