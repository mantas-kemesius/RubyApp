# frozen_string_literal: true

# Schedule
class Schedule < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :student
  has_many :subject
end
