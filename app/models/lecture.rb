# frozen_string_literal: true

class Lecture < ApplicationRecord
  has_many :students

  def student_getter
    studs = []
    list = Student.where(lectid: self)
    list.each do |stud|
      studs.push(stud.student)
    end
    studs
  end

  def status_set(status)
    if ['Active', 'Inactive', 'Cancelled'].include? status
      self.status = status
      save
    else
      false
    end
  end

  def add_student(mail)
    Student.create(email: mail)
    true
  end
end
