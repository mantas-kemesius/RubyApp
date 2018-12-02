# frozen_string_literal: true

require_relative 'application_record'
# Class For user
class User < ApplicationRecord
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
  validates :age, inclusion: 1...100, length: { minimum: 1, maximum: 3 }
  has_one :teacher
  has_one :student
  def print_user
    str = name + "\n" + last_name + "\n"
    str += '_________________________' + "\n"
    print str
  end
end
