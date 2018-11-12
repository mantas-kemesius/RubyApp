require_relative '../../ConsoleApp/lib/login_main'
require_relative '../../ConsoleApp/lib/signin_main'
require 'io/console'

# @active_user
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

def start_login
  loop do
    clear
    login_menu
    input = gets.chomp
    case input
    when '1'
      user_login
    when '2'
      user_sign_in
    when '0'
      break
    else
      'Incorrect input. Please enter numbers 0, 1 or 2'
    end
  end
end

def login_menu
  clear
  puts '[1] Login'
  puts '[2] Sign in'
  puts '[0] Exit from program'
end

# def print_week
#   clear
#   file = FilesHandler.new('../fakeDatabase/Schedule.json')
#   data = file.load_data.fetch('Schedule')
#   schedule = Schedule.new({
#                               'day' => '2',
#                               'time' => '14:00'
#                           }, '213', 'subject' => 'Programavimas')
#   data.each do |item|
#     (1..5).each do |count|
#       next unless item.fetch('date_day').to_i == count
#       puts '##############################'
#       puts "WEEKDAY #{item.fetch('date_day')}"
#       puts "TIME #{item.fetch('date_time')}"
#       puts "CLASSROOM #{item.fetch('class_number')}"
#       puts "SUBJECT #{item.fetch('subject_name')}"
#       puts "TEACHER #{item.fetch('teacher_id')}"
#     end
#   end
#   puts '##############################'
#   pause
# end
#
# def print_day(choice)
#   clear
#   file = FilesHandler.new('../fakeDatabase/Schedule.json')
#   data = file.load_data.fetch('Schedule')
#   schedule = Schedule.new({
#                               'day' => '2',
#                               'time' => '14:00'
#                           }, '213', 'subject' => 'Programavimas')
#   puts "WEEK DAY #{choice}"
#   data.each do |item|
#     next unless item.fetch('date_day').to_i == choice.to_i
#     puts '##############################'
#     puts "TIME #{item.fetch('date_time')}"
#     puts "CLASSROOM #{item.fetch('class_number')}"
#     puts "SUBJECT #{item.fetch('subject_name')}"
#     puts "TEACHER #{item.fetch('teacher_id')}"
#   end
#   puts '##############################'
#   pause
# end
#
# def print_choice
#   clear
#   puts 'Enter day number (1-5)'
#   choice = gets
#   print_day(choice)
# end

start_login
