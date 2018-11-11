# frozen_string_literal: true

require_relative 'notification'
require_relative '../../lib/helpers/files_handler'

# All notifications
class NotificationWindow
  attr_reader :notifications

  def initialize
    @notifications = []
  end

  def add_notification(notification)
    notifications << notification
  end

  def add_notification_now(title, text, sender)
    add_notification(Notification.new(Date.today.to_s, title, text, sender))
  end

  def delete_notification(position)
    notifications.delete_at(position)
  end

  def print_notifications
    notifications.each(&:print_notification)
  end
  # :reek:FeatureEnvy

  def save_notifications(path)
    file = FilesHandler.new(path)
    data = []
    notifications.each do |notification|
      data[data.length] = {
        'date' => notification.date, 'title' => notification.title,
        'text' => notification.text, 'sender' => notification.sender
      }
      file.save_data('Notifications' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_notifications(path)
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Notifications')
    info.each do |notification|
      add_notification(Notification.new(notification.fetch('date'),
                                        notification.fetch('title'),
                                        notification.fetch('text'),
                                        notification.fetch('sender')))
    end
  end
end
