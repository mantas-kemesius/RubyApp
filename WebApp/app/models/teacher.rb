# frozen_string_literal: true

require_relative 'application_record'
# Class For teachers info
class Teacher < ApplicationRecord
  validates_uniqueness_of :email,
                          message: 'your email should be unique'
  validates_length_of :name, maximum: 40,
                             message: 'name maximum length 40 chars'
  validates_length_of :last_name,
                      maximum: 40,
                      message: 'last name maximum length 40 chars'
  validates_length_of :email,
                      maximum: 60, message: 'email maximum length 40 chars'
  validates_length_of :password,
                      maximum: 30, message: 'password max length 40 chars'
  validates_length_of :university,
                      maximum: 60, message: 'university max length 40 chars'
  validates :age, inclusion: 1...100, length: { minimum: 1, maximum: 3 }
  has_one :schedules
  has_many :subjects
  has_many :mails
  has_many :notifications
  has_many :students, through: :subjects

  def print_teacher
    str = name + "\n" + last_name + "\n"
    str += '_________________________' + "\n"
    print str
  end
end
