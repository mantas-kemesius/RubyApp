class StudyManagement < ApplicationRecord
  def credits_setter(lectid, value)
    lect = Lecture.find_by(id: lectid)
    lect.credits = value
    lect.save
    true
  end
end
