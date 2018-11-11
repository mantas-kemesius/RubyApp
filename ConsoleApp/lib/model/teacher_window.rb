require_relative '../../lib/helpers/files_handler'
require 'pp'

# All teachers are placed here
class TeacherWindow
  attr_reader :teachers

  def initialize
    @teachers = []
  end

  def add_teacher(teacher)
    teachers << teacher
  end

  def delete_all
    @teachers = []
  end

  def delete_teacher(position)
    teachers.delete_at(position)
  end

  def delete_by_username(username)
    teachers.each do |item|
      if item.username.eql?(username)
        teachers.delete(item)
        delete_by_username(username)
      end
    end
  end

  def print_teachers
    teachers.each(&:print_teacher)
  end

  def append_teacher(teacher, path)
    load_teachers(path)
    add_teacher(teacher)
    save_teachers(path)
  end

  # :reek:FeatureEnvy
  def save_teachers(path)
    file = FilesHandler.new(path)
    data = []
    teachers.each do |teacher|
      data[data.length] = {
        'username' => teacher.username, 'university' => teacher.university,
        'faculty' => teacher.faculty
      }
      file.save_data('Teachers' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_teachers(path)
    delete_all
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Teachers')
    info.each do |teacher|
      add_teacher(Teacher.new(teacher.fetch('username'),
                              teacher.fetch('university'),
                              teacher.fetch('faculty')))
    end
  end
end
