require_relative '../../../ConsoleApp/lib/helpers/files_handler'

RSpec.configure do
  RSpec::Matchers.define :subject_has_valid_teacher do |path, teacher_id|
    match do
      file = FilesHandler.new(path)
      info = file.load_data.fetch('Teachers')
      info.each do |teacher|
        teacher.fetch('Username')
        return true if teacher.username.eql(teacher_id)
      end
    end
    failure_message do
      "Such teacher with id #{teacher_id} does not exist"
    end
  end
end
