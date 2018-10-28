require_relative 'notification'
# All notifications
class NotificationWindow
  def print_notifications
    array.each do |notification|
      puts notification.to_s
    end
  end

  def add(notification)
    array = []
    array << notification
    # return notification
    true
  end

  def view_notifications
    true
  end
end
