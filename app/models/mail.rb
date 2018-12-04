# frozen_string_literal: true

# Mail class
class Mail < ApplicationRecord
  belongs_to :from_emails, class_name: 'User', optional: true
  belongs_to :to_emails, class_name: 'User', optional: true
  validates :title, presence: true
  validates :message, presence: true

  def self.add(from, to, title, message)
    create(from: from, to: to, title: title,
           message: message)
  end

  def self.del(from)
    mail = find_by(from: from)
    destroy(mail.id)
  end

  def self.update_from_emails(from)
    update(from: from)
  end

  def self.update_to_emails(to)
    update(to: to)
  end

  def self.update_title(title)
    update(title: title)
  end

  def self.update_message(message)
    update(message: message)
  end
end
