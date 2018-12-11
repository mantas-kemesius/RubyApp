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

  def self.del(teacher)
    notification = find_by(teacher_id: teacher)
    destroy(notification.id)
  end

  # def delete_by_teacher_and_title(teacher)
  #   notification = Notification.find_by(teacher_id: teacher, title: title)
  #   Notification.destroy(notification.id)
  # end

  def print_notification
    str = title + "\n" + text + "\n" + sender + "\n"
    str += '_________________________' + "\n"
    print str
  end

  def self.print_by_sender(sender)
    notifications = Notification.find_by_sender(sender)
    if notifications.empty?
      puts 'Nothing to show'
    else
      notifications.each(&:print_notification)
    end
  end

  def update_title(new_title)
    update(title: new_title)
  end

  def update_text(new_text)
    update(text: new_text)
  end

  def update_sender(new_sender)
    update(sender: new_sender)
  end

  def self.find_by_sender(sender)
    Notification.where(sender: sender)
  end

  def self.existing_title(title)
    raise 'Not existing' unless Notification.exists?(title: title)

    true
  end
end
