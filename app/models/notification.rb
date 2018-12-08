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

  def del
    # notification = find_by(teacher_id: teacher)
    destroy
  end

  def delete_by_teacher_and_title(teacher)
    notification = Notification.find_by(teacher_id: teacher, title: title)
    Notification.destroy(notification.id)
  end

  def print_notification
    str = title + "\n" + text + "\n" + sender + "\n"
    str += '_________________________' + "\n"
    print str
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
end
