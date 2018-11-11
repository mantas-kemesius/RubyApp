require_relative '../helpers/files_handler'
require 'json'
# Description/Explanation of Student class
class StudentInfo
  attr_reader :subjects, :active, :mode
  def initialize(student)
    @subjects = student.fetch('subjects')
    @active = student.fetch('active')
    @mode = student.fetch('mode')
  end

  def change_mode(new_mode)
    @mode = new_mode
  end

  def change_active(new_active)
    @active = new_active
  end

  def add_subjects(new_subject)
    @subjects = subjects.push(new_subject)
  end

  def remove_first_subjects
    subjects.delete_at(0)
    subjects
  end

  def remove_subjects(subject)
    subjects.delete_at(find_subject(subject))
    subjects
  end

  def find_subject(subject)
    subjects.index(subject)
  end
  # deletestudent method reik delete nari padaryt
  # editstudent method reik deletestudent
  # add dalykai
  # remove dalykai
  # add dieninis/vakarinis
  # change dieninis/vakarinis
end
