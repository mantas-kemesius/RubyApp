class Teacher
  attr_accessor :name, :faculty, :university

  def initialize(name, university, faculty)
    @name = name
    @university = university
    @faculty = faculty
  end
end