RSpec.configure do
  RSpec::Matchers.define :be_correct_login do |username, password|
    match do |user|
      user.username.eql(username)&&
      user.password.eql(password)
    end
    failure_message do |password|
      " #{username} and #{password} is not correct"
    end
  end
end
