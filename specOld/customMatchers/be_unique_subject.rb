RSpec.configure do
  RSpec::Matchers.define :be_unique_subject do
    match do |subject_name|
      return true unless subject.subject_exists?(subject_name)
    end
    failure_message do |subject_name|
      " #{subject_name} is not unique"
    end
  end
end
