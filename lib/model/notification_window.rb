require_relative 'notification'
require_relative '../../lib/helpers/files_handler'
require 'json'
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

  # def save_notification(notification)
  #   file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
  #   file.save_data(['Notifications' => ['date' => notification.date,
  #                                       'title' => notification.title,
  #                                       'text' => notification.text,
  #                                       'sender' => notification.sender]])
  # end
  #
  # def load_notification
  #   file = FilesHandler.new('fakeDatabase/testFiles/Notifications.json')
  #   info = file.load_data[0]['Notifications'][0]
  #   Notification.new(info['date'],
  #                    info['title'], info['text'], info['sender'])
  # end
end
