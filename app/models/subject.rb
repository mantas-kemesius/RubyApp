# frozen_string_literal: true

# Subject class
class Subject < ApplicationRecord
  validates_length_of :name, maximum: 40,
                             message: 'name maximum length 40 characters'
end
