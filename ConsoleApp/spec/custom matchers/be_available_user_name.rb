RSpec.configure do
  RSpec::Matchers.define :be_available_user_name do |users|
    match do |user_name|
      return true if users.user_exists?(user_name)

      return false
    end
    failure_message do |user_name|
      " #{user_name} is not available"
    end
  end
end
