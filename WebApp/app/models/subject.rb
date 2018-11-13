class Subject < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  validates_length_of :name, maximum: 40, message: "name maximum length 40 characters"
  has_one :name
  has_one :description


end
