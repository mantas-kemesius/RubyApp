RSpec.configure do
  RSpec::Matchers.define :be_identical_to_file do |expected|
    match do |actual|
      expected_file = File.read(expected)
      actual_file = File.read(actual)
      actual_file == expected_file
    end
    failure_message do
      'File are not the same'
    end
  end
end
