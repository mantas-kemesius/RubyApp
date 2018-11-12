require_relative '../lib/model/notification_window'
require_relative '../../ConsoleApp/lib/notifications_main'
require_relative '../../ConsoleApp/lib/subjects_main'
require_relative '../../ConsoleApp/lib/email_main'
require 'date'
require 'io/console'

@active_user
@active_role
@user_dir_name = '../fakeDatabase/Users.json'
@teacher_dir_name = '../fakeDatabase/Teachers.json'
@student_dir_name = '../fakeDatabase/Students.json'
@email_dir_name = '../fakeDatabase/Emails.json'

def clear
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def pause
  print 'press any key'
  STDIN.getch
  print "                          \r"
end

def start_teacher
  loop do
    clear
    menu_teacher
    print 'Choose: '
    input = gets.chomp
    case input
    when '1'
      start_notifications
    when '2'
      start_emails
    when '3'
      start_subjects
    when '0'
      exit
    else
      puts 'Incorrect input'
    end
  end
end

def menu_teacher
  clear
  puts '[1] Notifications'
  puts '[2] Emails'
  puts '[3] Subjects'
  puts '[0] Exit from program'
end

def start_student
  loop do
    clear
    menu_student
    print 'Choose: '
    input = gets.chomp
    case input
    # when '1'
    #   start_notifications
    when '1'
      start_emails
    when '2'
      start_subjects
    when '0'
      exit
    else
      puts 'Incorrect input'
    end
  end
end

def menu_student
  clear
  # puts '[1] Notifications'
  puts '[1] Emails'
  puts '[2] Subjects'
  puts '[0] Exit from program'
end