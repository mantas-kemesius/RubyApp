require_relative 'notification'
require_relative '../../lib/helpers/files_handler'
# All notifications
class NotificationWindow
  def print_notifications(notifications)
    notifications.each(&:print_notification)
    true
  end

  def add(notifications, notification)
    notifications << notification
    # return notification
    true
  end

  def load_notifications
    file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
    file.load_data
    true
  end

  def view_notifications
    true
  end

  def delete_notification
    true
  end
  # notifications = []
  # item = NotificationWindow.new
  # notifications = item.add(notifications,
  # Notification.new('2018-28-10', 'First', 'Hello my name is tomas', 'Admin'))
  # item.print_notifications(notifications)
  # item.load_notifications
end
