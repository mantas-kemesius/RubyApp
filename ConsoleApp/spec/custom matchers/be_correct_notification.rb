RSpec.configure do
  RSpec::Matchers.define :be_correct_notification do |title, text|
    match do |notification|
      notification.title.eql(title)&&
      notification.text.eql(text)
    end
    failure_message do |title, text|
      " #{title} #{text} is not correct "
    end
  end
end
