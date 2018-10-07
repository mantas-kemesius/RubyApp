# Some Comment:)
class Teacher
  attr_reader :id, :faculty, :university, :onVacation
  attr_reader :subjects_count, :subjects

  def initialize(id, university, faculty)
    @id = id
    @university = university
    @faculty = faculty
    @onVacation = false
    @subjects_count = 0;
  end

  def goes_on_vacation(onVacation)
    @onVacation = onVacation
  end
end
