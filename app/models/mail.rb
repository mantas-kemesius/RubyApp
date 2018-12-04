# frozen_string_literal: true

# Mail class
class Mail < ApplicationRecord
  belongs_to :from_emails, class_name: 'User', optional: true
  belongs_to :to_emails, class_name: 'User', optional: true
  validates :title, presence: true
  validates :message, presence: true

  def self.add(from_id, to_id, title, message)
    create(from_id: from_id, to_id: to_id, title: title,
           message: message)
  end

  def self.del(from_id)
    mail = find_by(from_id: from_id)
    destroy(mail.id)
  end

  def self.update_from_emails(from_id)
    update(from_id: from_id)
  end

  def self.update_to_emails(to_id)
    update(to_id: to_id)
  end

  def self.update_title(title)
    update(title: title)
  end

  def self.update_message(message)
    update(message: message)
  end
end
