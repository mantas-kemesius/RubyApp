require_relative 'student'
require_relative '../../lib/helpers/files_handler'

# All notifications
class StudentWindow
  attr_reader :students

  def initialize
    @students = []
  end

  def add_student(student)
    students << student
  end

  def delete_student(position)
    students.delete_at(position)
  end

  # :reek:FeatureEnvy

  def save_students(path)
    file = FilesHandler.new(path)
    data = []
    students.each do |student|
      data[data.length] = {
        's_id' => student.s_id, 'group' => student.group,
        'study_program' => student.study_program, 'subjects' => student.subjects
      }
      file.save_data('Students' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_students(path)
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Students')
    info.each do |student|
      add_student(Student.new(student.fetch('s_id'),
                              student.fetch('group'),
                              student.fetch('study_program'),
                              student.fetch('subjects')))
    end
  end
end
