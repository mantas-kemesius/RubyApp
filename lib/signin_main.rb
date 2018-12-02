require_relative '../lib/model/user'
require_relative '../lib/model/teacher'
require_relative '../lib/model/student'
require_relative '../../ConsoleApp/lib/menu_main'
require 'io/console'

# @active_user
# @active_role
@user_dir_name = '../fakeDatabase/Users.json'
@teacher_dir_name = '../fakeDatabase/Teachers.json'
@student_dir_name = '../fakeDatabase/Students.json'

# def clear
#   Gem.win_platform? ? (system 'cls') : (system 'clear')
# end
#
# def pause
#   print 'press any key'
#   STDIN.getch
#   print "                          \r"
# end

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
  elsif role_input == '0'
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

def non_blank_input
  loop do
    input = gets.chomp
    return input unless input.empty?
  end
end

def email_used?(email)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data
  data.each do |item|
    return true if email == item.fetch('email')
  end
  false
end

def username_used?(dir_name, username)
  file = FilesHandler.new(dir_name)
  data = file.load_data
  data.each do |item|
    return true if username == item.fetch('username')
  end
  false
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