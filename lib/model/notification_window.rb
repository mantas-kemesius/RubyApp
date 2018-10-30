require_relative 'notification'
require_relative '../../lib/helpers/files_handler'

# All notifications
class NotificationWindow
  attr_reader :notifications, :size

  def initialize
    @notifications = []
    @size = 0
  end

  def add_notification(notification)
    notifications << notification
    @size += 1
  end

  def delete_notification(position)
    notifications.delete_at(position)
    @size -= 1
  end

  def print_notifications
    notifications.each(&:print_notification)
  end

  def save_notifications
    file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
    # TODO: SAVE ALL NOT ONE
    notifications.each do |notification|
      file.save_data('Notifications' => [{ 'date' => notification.date,
                                           'title' => notification.title,
                                           'text' => notification.text,
                                           'sender' => notification.sender }])
    end
  end
  # def append_notification(notification)
  #   file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
  #   info = file.load_data.fetch(0)
  #   info.fetch('Notifications') << {'date' => notification.date,
  #                             'title' => notification.title,
  #                             'text' => notification.text,
  #                             'sender' => notification.sender}
  #   file.save_data(info)
  # end

  def load_notifications
    file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
    info = file.load_data.fetch('Notifications')
    info.each do |item|
      add_notification(Notification.new(item.fetch('date'),
                                        item.fetch('title'),
                                        item.fetch('text'),
                                        item.fetch('sender')))
    end
  end
end
