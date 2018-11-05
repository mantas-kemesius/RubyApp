require_relative '../lib/model/notification_window'

@active_username
@active_role
@user_dir_name = '../fakeDatabase/Users.json'
@teacher_dir_name = '../fakeDatabase/Teachers.json'
@student_dir_name = '../fakeDatabase/Students.json'

def login_menu
  puts '[1] Login'
  puts '[2] Sign in'
  puts '[0] Exit from program'
end

def menu
  puts '[1] Notifications'
  puts '[2] ?'
  puts '[3] ?'
  puts '[4] Send email'
  puts '[5] Show all emails'
  puts '[6] Show all emails for...'
  puts '[7] Show all emails from...'
  puts '[0] Exit from program'
end

def print_all_emails
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
end

def print_all_emails_for
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
end

def print_all_emails_from
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
end

def send_email
  file = FilesHandler.new('../fakeDatabase/Emails.json')
  data = file.load_data
  print 'FROM: '
  email_from = gets.chomp
  print 'To: '
  email_to = gets.chomp
  print 'Title: '
  title = gets.chomp
  print 'Text: '
  text = gets.chomp
  data[data.length] = {
    'email_from' => email_from,
    'email_to' => email_to,
    'title' => title,
    'text' => text
  }
  file.save_data(data)
  puts 'Email was sent successfully'
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
      @active_username = in_uname
      @active_role = 1
      puts 'Login successful'
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
    puts 'Enter username / password'
    puts 'Enter [0] to exit'
    print 'Username: '
    in_uname = non_blank_input
    return if in_uname == '0'

    print 'Password: '
    in_psw = non_blank_input
    return if in_psw == '0'

    if login_correct?(@user_dir_name, in_uname, in_psw, 0)
      @active_username = in_uname
      @active_role = 0
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

  if email_used?(@user_dir_name, email)
    puts 'Email ' + email + ' already used'
    return
  end

  append_user(username, password, name, surname, 1, email, phone)
  append_teacher(username, in_uni, in_faculty)
  puts 'Account has been created successfully'
  puts ''
end

def student_sign_in(username, password, name, surname, email, phone)
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

  if email_used?(@user_dir_name, email)
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
    username: username,
    group: group,
    faculty: faculty,
    study_program: study_program
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

def username_used?(dir_name, username)
  file = FilesHandler.new(dir_name)
  data = file.load_data
  data.each do |item|
    return true if username == item.fetch('username')
  end
  return false
end

def email_used?(dir_name, email)
  file = FilesHandler.new(dir_name)
  data = file.load_data
  data.each do |item|
    return true if email == item.fetch('email')
  end
  return false
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
  return false
end

def start
  loop do
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
      send_email
    when '5'
      print_all_emails
    when '6'
      print_all_emails_for
    when '7'
      print_all_emails_from
    when '0'
      exit
    end
  end
end

def start_login
  loop do
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

def notifications_menu
  puts '[1] Show notifications'
  puts '[2] Add notification'
  puts '[3] Delete notification'
  puts '[0] Back'
end

def start_notifications
  notifications = NotificationWindow.new
  notifications.load_notifications(
      '../fakeDatabase/testFiles/Notifications_load.json'
  )
  loop do
    notifications_menu
    input = gets.chomp
    case input
    when '1'
      notifications.print_notifications
    when '2'
      notifications.add_notification(
          Notification.new('2018-10-30', 'Pavadinimas',
                           'kazkoks tekstas', 'Tomas')
      )
      notifications.save_notifications(
          '../fakeDatabase/testFiles/Notifications_load.json'
      )
    when '0'
      break
    else
      'Incorrect input. Please enter numbers 0, 1, 2 or 3'
    end
  end
end
start_login
