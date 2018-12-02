RSpec.configure do
  RSpec::Matchers.define :be_registered_user do
    match do |user_name|
      return false unless user.user_exists?(user_name)
    end
    failure_message do |user_name|
      " #{user_name} is not registered"
    end
  end
end
