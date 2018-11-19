require_relative '../../ConsoleApp/lib/model/user'
require_relative '../../ConsoleApp/lib/model/user_window'
require_relative '../lib/model/teacher'
require_relative '../lib/model/student'
require_relative '../../ConsoleApp/lib/menu_main'
require 'io/console'

@active_user
@active_role
@user_dir_name = '../fakeDatabase/Users.json'
@teacher_dir_name = '../fakeDatabase/Teachers.json'
@student_dir_name = '../fakeDatabase/Students.json'

def clear
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def pause
  print 'press any key'
  STDIN.getch
  print "                          \r"
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

def role_option(label)
  puts label
  loop do
    clear
    puts 'Select desired role:'
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

    users = UserWindow.new(@user_dir_name)
    users.load_users
    if valid_credentials?(users, in_uname, in_psw, 1)
      @active_user = users.user_by_username(in_uname)
      puts 'Labas'
      teachers = TeacherWindow.new
      teachers.load_teachers(@teacher_dir_name)
      @active_role = teachers.teacher_by_username(in_uname)

      puts 'Login successful'
      puts ''

      start_teacher
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

    users = UserWindow.new(@user_dir_name)
    users.load_users
    if valid_credentials?(users, in_uname, in_psw, 0)
      @active_user = users.user_by_username(in_uname)

      students = StudentWindow.new
      students.load_students(@student_dir_name)
      @active_role = students.student_by_username(in_uname)

      puts 'Login successful'
      puts ''

      start_student
    else
      puts 'Login failed'
      puts ''
    end
  end
end

def non_blank_input
  loop do
    input = gets.chomp
    return input unless input.empty?
  end
end

def valid_credentials?(users, username, password, role)
  user = users.user_by_username(username)
  return false if user.nil?

  return true if user.password.eql?(password) &&
                 user.role.eql?(role)

  false
end