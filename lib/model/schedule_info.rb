# Study Schedule class additional attributes
class ScheduleInfo
  attr_reader :class_number # , :subject_name, :teacher_id
  def initialize(class_number) # , subject_name, teacher_id)
    @class_number = class_number
    # @subject_name = subject_name
    # @teacher_id = teacher_id
  end
end
