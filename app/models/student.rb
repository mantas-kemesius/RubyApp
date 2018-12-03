# frozen_string_literal: true

require_relative 'application_record'
# Student class
class Student < ApplicationRecord
  validates_length_of :course, maximum: 60,
                               message: 'course max length 40 chars'
  validates_uniqueness_of :user_id,
                          message: 'user id should be unique'
  validates :group, inclusion: 1...6, length: { minimum: 1, maximum: 1 }
  belongs_to :user
  has_many :subjects
  has_many :mails
  has_one :schedule
  has_many :teachers, through: :subjects
  belongs_to :user

  def self.add(course, group, user)
    student = create(course: course, group: group)
    user.student = student
  end

  def self.del(user)
    student = find_by(user_id: user)
    destroy(student.id)
  end

  def self.change_course(student, course)
    student.course = course
  end

  def self.change_group(student, group)
    student.group = group
  end
end
