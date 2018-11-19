require_relative 'teacher_info'
# implements Teacher class
class Teacher < TeacherInfo
  def initialize(username, university, faculty)
    super(username, university, faculty)
  end

  def print_teacher
    str = username + "\n" + university + "\n" + faculty + "\n"
    str += '__________________________________________________' + "\n"
    print str
  end

  def change_username(username)
    @username = username
  end

  def change_university(university)
    @university = university
  end

  def change_faculty(faculty)
    @faculty = faculty
  end
end
