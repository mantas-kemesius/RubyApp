require_relative '../../ConsoleApp/lib/model/notification_window'

require 'date'
require 'io/console'

@active_user
# @active_role
# @user_dir_name = '../fakeDatabase/Users.json'
# @teacher_dir_name = '../fakeDatabase/Teachers.json'
# @student_dir_name = '../fakeDatabase/Students.json'
# @email_dir_name = '../fakeDatabase/Emails.json'

def clear
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def pause
  print 'press any key'
  STDIN.getch
  print "                          \r"
end

def start_notifications
  notifications = NotificationWindow.new
  notifications.load_notifications(
    '../fakeDatabase/Notifications.json'
  )
  loop do
    clear
    notifications_menu
    input = gets.chomp
    case input
    when '1'
      clear
      notifications.print_notifications
      pause
    when '2'
      notification_add(notifications)
    when '3'
      notification_del(notifications)
    when '0'
      break
    else
      'Incorrect input. Please enter numbers 0, 1, 2 or 3'
    end
  end
  notifications.save_notifications(
    '../fakeDatabase/Notifications.json'
  )
end

def notifications_menu
  clear
  puts '[1] Show notifications'
  puts '[2] Add notification'
  puts '[3] Delete notification'
  puts '[0] Back'
end

def notification_add(notifications)
  clear
  print 'Title: '
  title = non_blank_input
  return if title == '0'
  print 'Text: '
  text = non_blank_input
  return if text == '0'
  notifications.add_notification(
    Notification.new(Date.today.to_s, title,
                     text, @active_user.name + ' ' + @active_user.last_name)
  )
  puts 'Notification has been added successfully'
  puts ''
end

def notification_del(notifications)
  clear
  print 'At position '
  position = non_blank_input
  return if position == '0'
  puts notifications.notifications.length
  if position.to_i <= notifications.notifications.length
    notifications.delete_notification(position.to_i - 1)
  else
    puts 'Incorrect index'
  end
end

def non_blank_input
  loop do
    input = gets.chomp
    return input unless input.empty?
  end
end
