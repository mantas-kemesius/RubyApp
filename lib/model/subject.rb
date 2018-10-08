# Attributes of a study subject
class Subject
  attr_accessor :name, :description_text, :description_file, :number_of_credits
  attr_accessor :coordinating_teacher
  def initialize(name, description_text, description_file, number_of_credits,
                 coordinating_teacher)
    @name = name
    @description_text = description_text
    @description_file = description_file
    @number_of_credits = number_of_credits
    @coordinating_teacher = coordinating_teacher
  end
end