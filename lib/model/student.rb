require_relative 'student_info'
# Description/Explanation of Student class
class Student < StudentInfo
  attr_reader :s_id, :faculty, :group, :active
  def initialize(s_id, faculty, group)
    @s_id = s_id
    @faculty = faculty
    @group = group
    @active = 1
    super()
  end

  def add_subject(subject)
    subjects.push(subject)
  end

  def change_group(new_group)
    @group = new_group
  end

  def make_student_activity(new_active)
    @active = new_active
  end
end
