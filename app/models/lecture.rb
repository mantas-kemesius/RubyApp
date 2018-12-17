class Lecture < ApplicationRecord
  has_many :students

  def add_student(mail)
    Student.create(email: mail)
    true
  end

end
