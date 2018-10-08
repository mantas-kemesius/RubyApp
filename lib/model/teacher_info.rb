# Personal info of Teacher
class TeacherInfo
  attr_reader :id, :faculty, :university

  def initialize(id, university, faculty)
    @id = id
    @university = university
    @faculty = faculty
  end
end