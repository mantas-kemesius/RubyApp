# implements Teacher class
class Teacher < TeacherInfo
  attr_reader :on_vacation
  attr_reader :subjects
  def initialize(id, university, faculty)
    super(id, university, faculty)
    @on_vacation = false
    @subjects = []
  end

  def goes_on_vacation(on_vacation)
    @on_vacation = on_vacation
  end

  def enter_grade?
    true
  end

  def edit_grade?
    true
  end

  def delete_grade?
    true
  end
end
