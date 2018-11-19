RSpec.configure do
  RSpec::Matchers.define :be_correct_login do |username_exp, password_exp|
    match do |user|
      user.username.eql(username_exp) &&
        user.password.eql(password_exp)
    end
    failure_message do
      " #{username_exp} and #{password_exp} is not correct"
    end
  end
end
