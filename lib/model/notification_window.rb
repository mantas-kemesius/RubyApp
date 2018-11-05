require_relative 'notification'
require_relative '../../lib/helpers/files_handler'

# All notifications
class NotificationWindow
  attr_reader :notifications, :size

  def initialize
    @notifications = []
  end

  def add_notification(notification)
    notifications << notification
  end

  def delete_notification(position)
    notifications.delete_at(position)
  end

  def print_notifications
    notifications.each(&:print_notification)
  end

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

  def load_notifications(path)
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Notifications')
    info.each do |item|
      add_notification(Notification.new(item.fetch('date'),
                                        item.fetch('title'),
                                        item.fetch('text'),
                                        item.fetch('sender')))
    end
  end
end
