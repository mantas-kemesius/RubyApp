require_relative '../../lib/helpers/files_handler'
require 'json'
# Description/Explanation of Student class
class Student
  attr_reader :s_id, :group, :study_program, :subjects

  def initialize(s_id, group, study_program, subjects)
    @s_id = s_id
    @group = group if group.positive?
    @study_program = study_program
    @subjects = subjects
  end

  def change_group(new_group)
    @group = new_group if new_group.positive?
  end

  def change_study_program(new_study_program)
    @study_program = new_study_program
  end

  def change_sid(new_s_id)
    @s_id = new_s_id
  end

  def add_subjects(new_subject)
    subjects.push(new_subject) unless subjects.include?(new_subject)
  end

  def remove_first_subjects
    subjects.delete_at(0)
  end

  def remove_subjects(subject)
    subjects.delete_at(find_subject(subject))
  end

  def find_subject(subject)
    subjects.index(subject)
  end
end
