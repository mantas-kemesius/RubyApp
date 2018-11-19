require_relative '../../../ConsoleApp/lib/helpers/files_handler'

RSpec.configure do
  RSpec::Matchers.define :check_before_delete_subject do |path, subject_name|
    match do
      file = FilesHandler.new(path)
      info = file.load_data.fetch('Students')
      info.each do |student|
        student.fetch('Subjects')
        return true unless student.subjects.include?(subject_name)
      end
    end
    failure_message do
      "expected #{title.inspect} not to be in student's subject
      list before deleting"
    end
  end
end
