require_relative '../lib/model/notification_window'
require_relative './model/schedule'

require_relative '../lib/model/user'
require_relative '../lib/model/teacher'
require_relative '../lib/model/student'
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

def login_menu
  clear
  puts '[1] Login'
  puts '[2] Sign in'
  puts '[0] Exit from program'
end

def menu
  clear
  puts '[1] Notifications'
  puts '[4] Emails'
  # puts '[4] Send email'
  # puts '[5] Show all emails'
  # puts '[6] Show all emails for...'
  # puts '[7] Show all emails from...'
  puts '[8] Show schedule by day'
  puts '[9] Show schedule by week'
  puts '[0] Exit from program'
end

def print_sent_emails
  clear
  file = FilesHandler.new(@email_dir_name)
  data = file.load_data
  data.each do |item|
    next unless @active_user.email == item.fetch('email_from')
    puts
    puts '------------------'
    puts
    puts "FROM: #{item.fetch('email_from')}"
    puts "TO: #{item.fetch('email_to')}"
    puts "TITLE: #{item.fetch('title')}"
    puts "TEXT: #{item.fetch('text')}"
  end
  puts
  puts '------------------'
  puts
  pause
end

def print_received_emails
  clear
  file = FilesHandler.new(@email_dir_name)
  data = file.load_data
  data.each do |item|
    next unless @active_user.email == item.fetch('email_to')
    puts
    puts '------------------'
    puts
    puts "FROM: #{item.fetch('email_from')}"
    puts "TO: #{item.fetch('email_to')}"
    puts "TITLE: #{item.fetch('title')}"
    puts "TEXT: #{item.fetch('text')}"
  end
  puts
  puts '------------------'
  puts
  pause
end

def print_all_emails
  clear
  file = FilesHandler.new('../fakeDatabase/Emails.json')
  data = file.load_data
  data.each do |item|
    puts
    puts '------------------'
    puts
    puts "FROM: #{item.fetch('email_from')}"
    puts "TO: #{item.fetch('email_to')}"
    puts "TITLE: #{item.fetch('title')}"
    puts "TEXT: #{item.fetch('text')}"
  end
  puts
  puts '------------------'
  puts
  pause
end

def print_all_emails_for
  clear
  print 'Email: '
  email = gets.chomp
  file = FilesHandler.new('../fakeDatabase/Emails.json')
  data = file.load_data
  data.each do |item|
    next unless email == item.fetch('email_to')
    puts
    puts '------------------'
    puts
    puts "FROM: #{item.fetch('email_from')}"
    puts "TO: #{item.fetch('email_to')}"
    puts "TITLE: #{item.fetch('title')}"
    puts "TEXT: #{item.fetch('text')}"
  end
  puts
  puts '------------------'
  puts
  pause
end

def print_all_emails_from
  clear
  print 'Email: '
  email = gets.chomp
  file = FilesHandler.new('../fakeDatabase/Emails.json')
  data = file.load_data
  data.each do |item|
    next unless email == item.fetch('email_from')
    puts
    puts '------------------'
    puts
    puts "FROM: #{item.fetch('email_from')}"
    puts "TO: #{item.fetch('email_to')}"
    puts "TITLE: #{item.fetch('title')}"
    puts "TEXT: #{item.fetch('text')}"
  end
  puts
  puts '------------------'
  puts
  pause
end

def send_email
  file = FilesHandler.new(@email_dir_name)
  data = file.load_data
  print 'To: '
  email_to = gets.chomp
  if email_used?(email_to)
    print 'Title: '
    title = gets.chomp
    print 'Text: '
    text = gets.chomp
    data[data.length] = {
      email_from: @active_user.email,
      email_to: email_to,
      title: title,
      text: text
    }
    file.save_data(data)
    puts 'Email was sent successfully'
  else
    puts 'Email ' + email_to + ' not found'
  end
  #   file = FilesHandler.new('../fakeDatabase/Emails.json')
  #   data = file.load_data
  #   print 'FROM: '
  #   email_from = gets.chomp
  #   print 'To: '
  #   email_to = gets.chomp
  #   print 'Title: '
  #   title = gets.chomp
  #   print 'Text: '
  #   text = gets.chomp
  #   data[data.length] = {
  #     email_from: email_from,
  #     email_to: email_to,
  #     title: title,
  #     text: text
  #   }
  #   file.save_data(data)
  #   puts 'Email was sent successfully'
end

def user_login
  loop do
    role_input = role_option('What is your role?')

    return if role_input == '0'

    if role_input == '1'
      teacher_login
    elsif role_input == '2'
      student_login
    end
  end
end

def teacher_login
  loop do
    puts 'Enter username / password'
    puts 'Enter [0] to exit'
    print 'Username: '
    in_uname = non_blank_input
    return if in_uname == '0'

    print 'Password: '
    in_psw = non_blank_input
    return if in_psw == '0'

    if login_correct?(@user_dir_name, in_uname, in_psw, 1)
      @active_user = user_by_username(in_uname)
      @active_role = teacher_by_username(in_uname)
      puts 'Login successful'
      puts 'Logged in as' + @active_user
      puts ''

      start
    else
      puts 'Login failed'
      puts ''
    end
  end
end

def student_login
  loop do
    clear
    puts 'Enter username / password'
    puts 'Enter [0] to exit'
    print 'Username: '
    in_uname = non_blank_input
    return if in_uname == '0'

    print 'Password: '
    in_psw = non_blank_input
    return if in_psw == '0'

    if login_correct?(@user_dir_name, in_uname, in_psw, 0)
      @active_user = user_by_username(in_uname)
      # TODO: fix student initializer first.
      # s_id should be string, not integer
      # @active_role = student_by_username(in_uname)
      puts 'Login successful'
      puts ''

      start
    else
      puts 'Login failed'
      puts ''
    end
  end
end

def user_sign_in
  clear
  puts 'Create new user.'
  puts 'Enter [0] to exit'
  print 'Username*: '
  in_uname = non_blank_input
  return if in_uname == '0'

  print 'Password*: '
  in_psw = non_blank_input
  return if in_psw == '0'

  print 'Name*: '
  in_name = non_blank_input
  return if in_name == '0'

  print 'Surname*: '
  in_surname = non_blank_input
  return if in_surname == '0'

  print 'Email*: '
  in_email = non_blank_input
  return if in_email == '0'

  print 'Phone: '
  in_phone = gets.chomp
  return if in_phone == '0'

  role_input = role_option('New account role:')
  if role_input == '1'
    teacher_sign_in(in_uname, in_psw, in_name, in_surname, in_email, in_phone)
  elsif role_input == '2'
    student_sign_in(in_uname, in_psw, in_name, in_surname, in_email, in_phone)
  elsif role_input.zero?
    return
  end
end

def teacher_sign_in(username, password, name, surname, email, phone)
  clear
  print 'University*: '
  in_uni = non_blank_input
  return if in_uni == '0'

  print 'Faculty: '
  in_faculty = gets.chomp
  return if in_faculty == '0'

  if username_used?(@user_dir_name, username)
    puts 'Username ' + username + ' already used'
    return
  end

  if email_used?(email)
    puts 'Email ' + email + ' already used'
    return
  end

  append_user(username, password, name, surname, 1, email, phone)
  append_teacher(username, in_uni, in_faculty)
  puts 'Account has been created successfully'
  puts ''
end

def student_sign_in(username, password, name, surname, email, phone)
  clear
  print 'Group*: '
  in_group = non_blank_input
  return if in_group == '0'
  print 'Faculty*: '
  in_faculty = non_blank_input
  return if in_faculty == '0'
  print 'Study program*: '
  in_study_program = non_blank_input
  return if in_study_program == '0'

  if username_used?(@user_dir_name, username)
    puts 'Username ' + username + ' already used'
    return
  end

  if email_used?(email)
    puts 'Email ' + email + ' already used'
    return
  end

  append_user(username, password, name, surname, 0, email, phone)
  append_student(username, in_group, in_faculty, in_study_program)
  puts 'Account has been created successfully'
  puts ''
end

def append_user(username, password, name, surname, role_id, email, phone)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data
  data[data.length] = {
    username: username,
    password: password,
    name: name,
    surname: surname,
    email: email,
    role_id: role_id,
    role: role_string(role_id),
    phone: phone
  }
  file.save_data(data)
end

def append_teacher(username, university, faculty)
  file = FilesHandler.new(@teacher_dir_name)
  data = file.load_data
  data[data.length] = {
    username: username,
    university: university,
    faculty: faculty
  }
  file.save_data(data)
end

def append_student(username, group, faculty, study_program)
  file = FilesHandler.new(@student_dir_name)
  data = file.load_data
  data[data.length] = {
    s_id: username,
    group: group,
    faculty: faculty,
    study_program: study_program,
    subjects: '',
    active: 0,
    mode: 0
  }
  file.save_data(data)
end

def role_string(role_id)
  if role_id.zero?
    'ROLE_STUDENT'
  elsif role_id == 1
    'ROLE_TEACHER'
  end
end

def role_option(label)
  puts label
  loop do
    clear
    puts '[1] Teacher'
    puts '[2] Student'
    puts '[0] Back'
    print 'Choose: '
    role_input = gets.chomp
    puts ''
    case role_input
    when '1'
      return '1'
    when '2'
      return '2'
    when '0'
      return '0'
    else
      'Incorrect input. Enter 1, 2 or 0'
    end
  end
end

def non_blank_input
  loop do
    input = gets.chomp
    return input unless input.empty?
  end
end

def user_by_username(username)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data
  data.each do |item|
    next unless username == item.fetch('username')
    user = User.new(item.fetch('name'), item.fetch('surname'),
                    item.fetch('role_id'), item.fetch('email'),
                    item.fetch('phone'))
    return user
  end
end

def student_by_username(username)
  file = FilesHandler.new(@student_dir_name)
  data = file.load_data
  data.each do |item|
    next unless username == item.fetch('s_id')
    student = Student.new(item)
    return student
  end
end

def teacher_by_username(username)
  file = FilesHandler.new(@teacher_dir_name)
  data = file.load_data
  data.each do |item|
    next unless username == item.fetch('username')
    teacher = Teacher.new(item.fetch('username'), item.fetch('university'),
                         item.fetch('faculty'))
    return teacher
  end
end

def username_used?(dir_name, username)
  file = FilesHandler.new(dir_name)
  data = file.load_data
  data.each do |item|
    return true if username == item.fetch('username')
  end
  false
end

def email_used?(email)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data
  data.each do |item|
    return true if email == item.fetch('email')
  end
  false
end

def login_correct?(dir_name, username, password, role_id)
  file = FilesHandler.new(dir_name)
  data = file.load_data
  data.each do |item|
    if username == item.fetch('username')
      return true if password == item.fetch('password') &&
                     role_id == item.fetch('role_id')
    end
  end
  false
end

def start
  loop do
    clear
    menu
    print 'Choose: '
    input = gets.chomp
    case input
    when '1'
      start_notifications
    when '2'
      # empty
    when '3'
    #   notification function will be here
    when '4'
      start_emails
    when '8'
      print_choice
    when '9'
      print_week
    when '0'
      exit
    else
      puts 'Incorrect input'
    end
  end
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

def emails_menu
  clear
  puts 'Emails'
  puts '[1] Compose an email'
  puts '[2] Inbox'
  puts '[3] Sent'
end

def start_emails
  loop do
    emails_menu
    input = gets.chomp
    case input
    when '1'
      send_email
    when '2'
      print_received_emails
    when '3'
      print_sent_emails
    when '0'
      break
    else
      'Incorrect input. Please enter numbers 0, 1, 2 or 3'
    end
  end
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
                       text, @active_user.to_s)
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
    notifications.delete_notification(position.to_i-1)
  else
  puts 'Incorrect index'
  end
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

def print_week
  clear
  file = FilesHandler.new('../fakeDatabase/Schedule.json')
  data = file.load_data.fetch('Schedule')
  schedule = Schedule.new({
                              'day' => '2',
                              'time' => '14:00'
                          }, '213', 'subject' => 'Programavimas')
  data.each do |item|
    (1..5).each do |count|
      next unless item.fetch('date_day').to_i == count
      puts '##############################'
      puts "WEEKDAY #{item.fetch('date_day')}"
      puts "TIME #{item.fetch('date_time')}"
      puts "CLASSROOM #{item.fetch('class_number')}"
      puts "SUBJECT #{item.fetch('subject_name')}"
      puts "TEACHER #{item.fetch('teacher_id')}"
    end
  end
  puts '##############################'
  pause
end

def print_day(choice)
  clear
  file = FilesHandler.new('../fakeDatabase/Schedule.json')
  data = file.load_data.fetch('Schedule')
  schedule = Schedule.new({
                              'day' => '2',
                              'time' => '14:00'
                          }, '213', 'subject' => 'Programavimas')
  puts "WEEK DAY #{choice}"
  data.each do |item|
    next unless item.fetch('date_day').to_i == choice.to_i
    puts '##############################'
    puts "TIME #{item.fetch('date_time')}"
    puts "CLASSROOM #{item.fetch('class_number')}"
    puts "SUBJECT #{item.fetch('subject_name')}"
    puts "TEACHER #{item.fetch('teacher_id')}"
  end
  puts '##############################'
  pause
end

def print_choice
  clear
  puts 'Enter day number (1-5)'
  choice = gets
  print_day(choice)
end

start_login
