RSpec.configure do
  RSpec::Matchers.define :be_admin do
    match do |admin|
      username = 'Admin'
      password = 'AdminPassword'
      role = 'ROLE_ADMIN'
      is_true = admin.username.eql?(username) && admin.password.eql?(password)
      is_true &&= admin.role.eql?(role)
      return is_true
    end
    failure_message do |admin|
      "#{admin.username} #{admin.password},
      is not admin"
    end
  end
end
