RSpec.configure do
  RSpec::Matchers.define :be_correct_password do
    match do |password|
      actual_length = password.length
      length_min = 5
      length_max = 30
      return actual_length >= length_min && length_max <= actual_length
    end
    failure_message do |password|
      " #{password} is not correct length"
    end
  end
end
