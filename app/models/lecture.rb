# frozen_string_literal: true

# Student lectures
class Lecture < ApplicationRecord
  has_many :students

  def student_getter
    studs = []
    list = Student.where(lectid: self)
    list.each do |stud|
      studs.push(stud)
    end
    studs
  end

  def status_set(status)
    if %w[Active Inactive Cancelled].include? status
      self.status = status
      save
    else
      false
    end
  end

  def add_student(name)
    Student.create(lectid: id, name: name)
    true
  end
end
