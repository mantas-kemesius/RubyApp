RSpec.configure do
  RSpec::Matchers.define :user_values_changed do |name, last_name, role, email, phone|
    match do |user|
      user.name.eql(name) &&
      user.last_name.eql(last_name) &&
      user.role.eql(role) &&
      user.phone.eql(phone) &&
      user.email.eql(email)
    end
    failure_message do 
      "Expected:
        name = #{name}
        last_name = #{last_name}
        role = #{role}
        phone = #{phone}
        email = #{email}"
    end
  end
end
