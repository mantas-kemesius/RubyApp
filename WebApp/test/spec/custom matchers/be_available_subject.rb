RSpec.configure do
  RSpec::Matchers.define :be_available_subject do |subjects|
    match do |subject_name|
      return true if subjects.subject_exists?(subject_name)
      return false
    end
    failure_message do |subject_name|
      " #{subject_name} is not available"
    end
  end
end
