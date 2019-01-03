# frozen_string_literal: true

require_relative 'application_record'
# Class For teachers info
class Teacher < ApplicationRecord
  # :reek:UtilityFunction
  def delete_project(lecture)
    proj = Lecture.find_by(id: lecture)
    proj.destroy
  end
  # def self.add(university, user)
  #   teacher = create(university: university)
  #   user.teacher = teacher
  # end
  #
  # def self.del(user)
  #   teacher = find_by(user_id: user)
  #   destroy(teacher.id)
  # end
end
