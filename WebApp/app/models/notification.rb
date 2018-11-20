class Notification < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  # belongs_to :teacher

  def print_notification
    str = "\n" + title + "\n" + text + "\n"
    str += '____________________________________________________' + "\n"
    print str
  end
  def change_title(newTitle)
    @title = newTitle
    self.save
  end
end
