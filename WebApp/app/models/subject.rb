class Subject < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_one :schedule
  validates_length_of :name, maximum: 40, message: "name maximum length 40 characters"
  validates_length_of :description, maximum: 200, message: "description maximum length 200 characters"

end
