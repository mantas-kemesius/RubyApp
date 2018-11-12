# Personal info of Teacher
class TeacherInfo
  attr_reader :username, :faculty, :university
  def initialize(username, university, faculty)
    @username = username
    @university = university
    @faculty = faculty
  end
end
