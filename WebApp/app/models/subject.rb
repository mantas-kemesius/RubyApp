class Subject < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_one :schedule
  validates_length_of :name, maximum: 40, message: "name maximum length 40 characters"
end
