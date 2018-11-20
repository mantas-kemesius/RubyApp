class Notification < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :teacher
end
