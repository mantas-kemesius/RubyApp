require_relative '../../ConsoleApp/lib/model/user'
require_relative '../../ConsoleApp/lib/model/user_window'
require_relative '../../ConsoleApp/lib/model/teacher'
require_relative '../../ConsoleApp/lib/model/teacher_window'
require_relative '../../ConsoleApp/lib/model/student'
require_relative '../../ConsoleApp/lib/model/student_window'
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

  print 'last_name*: '
  in_last_name = non_blank_input
  return if in_last_name == '0'

  print 'Email*: '
  in_email = non_blank_input
  return if in_email == '0'

  print 'Phone: '
  in_phone = gets.chomp
  return if in_phone == '0'

  role_input = role_option('New account role:')
  if role_input == '1'
    teacher_sign_in(in_uname, in_psw, in_name, in_last_name, in_email, in_phone)
  elsif role_input == '2'
    student_sign_in(in_uname, in_psw, in_name, in_last_name, in_email, in_phone)
  elsif role_input == '0'
    return
  end
end

def teacher_sign_in(username, password, name, last_name, email, phone)
  clear
  print 'University*: '
  in_uni = non_blank_input
  return if in_uni == '0'

  print 'Faculty: '
  in_faculty = gets.chomp
  return if in_faculty == '0'

  users = UserWindow.new(@user_dir_name)
  users.load_users
  if users.user_exists?(username)
    puts 'Username ' + username + ' already used'
    return
  end

  if users.email_used?(email)
    puts 'Email ' + email + ' already used'
    return
  end

  users.add_user(user_hash(username, password,
                           name, last_name,
                           1, email, phone))
  teachers = TeacherWindow.new
  teachers.load_teachers(@teacher_dir_name)
  teachers.add_teacher(Teacher.new(username, in_uni, in_faculty))

  users.save_users
  teachers.save_teachers(@teacher_dir_name)
  puts 'Account has been created successfully'
  puts ''
end

def student_sign_in(username, password, name, last_name, email, phone)
  clear
  print 'Group*: '
  in_group = integer_input
  return if in_group == 0 || in_group == nil
  print 'Faculty*: '
  in_faculty = non_blank_input
  return if in_faculty == '0'
  print 'Study program*: '
  in_study_program = non_blank_input
  return if in_study_program == '0'

  users = UserWindow.new(@user_dir_name)
  users.load_users
  if users.user_exists?(username)
    puts 'Username ' + username + ' already used'
    return
  end

  if users.email_used?(email)
    puts 'Email ' + email + ' already used'
    return
  end

  users.add_user(user_hash(username, password,
                           name, last_name,
                           0, email, phone))
  students = StudentWindow.new
  students.load_students(@student_dir_name)
  students.add_student(Student.new(username, in_group.to_i,
                                   in_faculty, in_study_program))

  users.save_users
  students.save_students(@student_dir_name)
  puts 'Account has been created successfully'
  puts ''
end

def non_blank_input
  loop do
    input = gets.chomp
    return input unless input.empty?
  end
end

def append_student(username, group, faculty, study_program)
  file = FilesHandler.new(@student_dir_name)
  data = file.load_data
  data[data.length] = {
      s_id: username,
      group: group.to_i,
      faculty: faculty,
      study_program: study_program,
      subjects: '',
      active: 0,
      mode: 0
  }
  file.save_data('Students' => data)
end

def user_hash(username, password, name, last_name, role_id, email, phone)
  {
      'username' => username,
      'password' => password,
      'name' => name,
      'last_name' => last_name,
      'role_id' => role_id,
      'email' => email,
      'phone' => phone
  }
end

def integer_input
  user_num = Integer(gets) rescue false
  if user_num
    return user_num
  else return nil
  end
end