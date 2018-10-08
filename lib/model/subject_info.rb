# Additional attributes of a study subject
class SubjectInfo
  attr_accessor :name, :description_text, :description_file
  attr_accessor :number_of_credits, :coordinating_teacher, :schedule_entry
  def initialize(name, description_text, description_file, number_of_credits,
                 coordinating_teacher)
    @name = name
    @description_text = description_text
    @description_file = description_file
    @number_of_credits = number_of_credits
    @coordinating_teacher = coordinating_teacher
  end
end
