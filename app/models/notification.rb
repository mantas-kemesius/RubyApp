# frozen_string_literal: true

# Class for notifications
class Notification < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :sender, presence: true
  belongs_to :teacher

  def self.add(title, text, teacher)
    create(title: title, text: text, sender: teacher.full_name)
  end

  def print_notification
    str = "\n" + title + "\n" + text + "\n"
    str += '____________________________________________________' + "\n"
    print str
  end

  def change_title(new_title)
    @title = new_title
    save
  end
end
