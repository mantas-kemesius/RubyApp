# Some Comment:)
class Teacher
  attr_reader :id, :faculty, :university, :onVacation

  def initialize(id, university, faculty)
    @id = id
    @university = university
    @faculty = faculty
    @onVacation = false
  end

  def goes_on_vacation(onVacation)
    @onVacation = onVacation
  end
end
