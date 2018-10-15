# Description/Explanation of Student class
class Student
  attr_reader :s_id, :group, :faculty, :study_program

  def initialize(s_id, group, faculty, study_program)
    @s_id = s_id if s_id.positive?
    @group = group if group.positive?
    @faculty = faculty
    @study_program = study_program
  end

  def change_group(new_group)
    @group = new_group if new_group.positive?
  end

  def change_faculty(new_faculty)
    @faculty = new_faculty
  end

  def change_study_program(new_study_program)
    @study_program = new_study_program
  end
end
