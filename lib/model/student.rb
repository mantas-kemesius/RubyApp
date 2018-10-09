# Description/Explanation of Student class
class Student
  attr_reader :s_id, :faculty, :group, :subjects, :timetable, :active
  def initialize(student_id, faculty, group, active = 0)
    @s_id = student_id
    @faculty = faculty
    @group = group
    @active = active
    @subjects = []
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
