RSpec.configure do
  RSpec::Matchers.define :be_user_admin do
    match do |admin|
      role = 'ROLE_ADMIN'
      is_true &&= admin.role.eql?(role)
      return is_true
    end
    failure_message do |admin|
      "User #{admin.username} is not admin"
    end
  end
end
