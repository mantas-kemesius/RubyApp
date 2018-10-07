# implements user
class Teacher < TeacherInfo

  attr_reader :on_vacation
  attr_reader :subjects_count, :subjects

  def initialize(id, university, faculty)
    super(id, university, faculty)
    @on_vacation = false
    @subjects_count = 0
     @subjects = []
  end

  def goes_on_vacation(on_vacation)
    @on_vacation = on_vacation
  end
end
