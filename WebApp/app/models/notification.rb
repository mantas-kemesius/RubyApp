class Notification < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  # belongs_to :teacher

  def mutant_should_fail
        notifications = []
  end
end
