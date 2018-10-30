require_relative '../lib/model/notification_window'

def menu
  puts '1. Show notifications'
  puts '2. Add notification'
  # puts '3. Delete notification'
  puts 'exit: To exit from program'
end

def print_notifications
  notifications = NotificationWindow.new
  notifications.load_notifications(
    '../fakeDatabase/testFiles/Notifications.json'
  )
  notifications.print_notifications
end

def add_and_save
  notifications = NotificationWindow.new
  notifications.add_notification(
    Notification.new('2018-10-30', 'Pavadinimas',
                     'kazkoks tekstas', 'Tomas')
  )
  notifications.save_notifications(
    '../fakeDatabase/testFiles/Notifications.json'
  )
end

def start
  loop do
    menu
    print 'Choose: '
    input = gets.chomp
    case input
    when '1'
      print_notifications
    when '2'
      add_and_save
    when 'exit'
      break
    end
  end
end

start
