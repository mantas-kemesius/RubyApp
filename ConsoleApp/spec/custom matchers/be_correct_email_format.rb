RSpec.configure do
  RSpec::Matchers.define :be_correct_email_format do
    match do |email_text|
      regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
      expect(email_text).to match(regex)
    end
    failure_message do
      'Email address is not written in a correct format'
    end
  end
end
