# Additional attributes of a Study Subject class
class SubjectInfo
  attr_reader :number_of_credits, :coordinating_teacher
  def initialize(number_of_credits, coordinating_teacher)
    @number_of_credits = number_of_credits
    @coordinating_teacher = coordinating_teacher
  end
end
