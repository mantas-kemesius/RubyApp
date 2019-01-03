# frozen_string_literal: true

# Study management for looking for lectures/students credits
class StudyManagement < ApplicationRecord
  # :reek:UtilityFunction
  def credits_setter(lectid, value)
    lect = Lecture.find_by(id: lectid)
    lect.credits = value
    lect.save
    true
  end
end
