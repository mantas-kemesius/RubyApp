# frozen_string_literal: true

# Student class
class Student < ApplicationRecord
  validates_uniqueness_of :email, message: 'your email should be unique'
  validates_length_of :name, maximum: 40,
                             message: 'name max length 40 charas'
  validates_length_of :last_name, maximum: 40,
                                  message: 'lastname max length 40 chars'
  validates_length_of :email, maximum: 60,
                              message: 'email max length 40 chars'
  validates_length_of :password, maximum: 30,
                                 message: 'password max length 40 chars'
  validates_length_of :university, maximum: 60,
                                   message: 'university max length 40 chars'
  validates :age, inclusion: 1...100, length: { minimum: 1, maximum: 3 }
  has_many :subjects
  has_many :mails
  has_one :schedule
  has_many :teachers, through: :subjects
end
