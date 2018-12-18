# frozen_string_literal: true

# Student class
class Student < ApplicationRecord
  validates_length_of :university, maximum: 60,
                                   message: 'university max length 40 chars'
  has_many :subjects
  has_many :mails
  has_one :schedule
  has_many :teachers, through: :subjects
end
