# frozen_string_literal: true

# Mail class
class Mail < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
end
