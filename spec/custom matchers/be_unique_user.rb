RSpec.configure do
  RSpec::Matchers.define :be_unique_user do
    match do |user|
      return true unless user.user_exists?
    end
    failure_message do |user|
      " #{user.username} is not unique"
    end
  end
end
