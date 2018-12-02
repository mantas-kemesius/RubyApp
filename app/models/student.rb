# frozen_string_literal: true

# Student class
class Student < ApplicationRecord
  validates_length_of :university, maximum: 60,
                                   message: 'university max length 40 chars'
  validates :age, inclusion: 1...100, length: { minimum: 1, maximum: 3 }
  belongs_to :user
  has_many :subjects
  has_many :mails
  has_one :schedule
  has_many :teachers, through: :subjects
end
