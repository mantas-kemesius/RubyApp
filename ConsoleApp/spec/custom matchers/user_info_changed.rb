RSpec.configure do
  RSpec::Matchers.define :user_info_changed do |name, las, role, email, pho|
    match do |user|
      user.name.eql(name) &&
        user.last_name.eql(las) &&
        user.role.eql(role) &&
        user.phone.eql(pho) &&
        user.email.eql(email)
    end
    failure_message do
      "Expected:
        name = #{name}
        last_name = #{las}
        role = #{role}
        phone = #{pho}
        email = #{email}"
    end
  end
end
