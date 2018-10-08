# Attributes of a study subject
class Subject < SubjectInfo
  attr_reader :name, :description_text, :description_file
  def initialize(name, description_text, description_file, number_of_credits,
                 coordinating_teacher)
    super(number_of_credits, coordinating_teacher)
    @name = name
    @description_text = description_text
    @description_file = description_file
  end
end
