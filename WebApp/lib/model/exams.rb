# frozen_string_literal: true

# Class of study examinations
class Exams
  attr_reader :subject_name, :date_month, :date_day, :date_time
  # , amount_of_credits)
  def initialize(subject_name, date)
    @subject_name = subject_name
    @date_month = date.fetch('month')
    @date_day = date.fetch('day')
    @date_time = date.fetch('time')
    # @amount_of_credits = amount_of_credits
  end
end
