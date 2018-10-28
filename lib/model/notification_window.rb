require_relative 'notification'
# All notifications
class NotificationWindow
  def print_notifications
    array = []
    array.each do |notification|
      puts notification.to_s
    end
    true
  end

  def add(notification)
    array = []
    array << notification
    # return notification
    true
  end

  def load_notifications
    # files_handler = FilesHandler.new('Notifications')
    # files_handler.load_data
    true
  end

  def view_notifications
    true
  end

  def delete_notification
    true
  end
end
