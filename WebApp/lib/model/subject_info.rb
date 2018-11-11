# frozen_string_literal: true

# Additional attributes of a Study Subject class
class SubjectInfo
  attr_reader :credits, :teacher
  def initialize(number_of_credits, coordinating_teacher)
    @credits = number_of_credits
    @teacher = coordinating_teacher
  end
end
