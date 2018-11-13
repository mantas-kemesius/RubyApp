require_relative '../../ConsoleApp/lib/model/user'
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

    if login_correct?(@user_dir_name, in_uname, in_psw, 1)
      @active_user = user_by_username(in_uname)
      @active_role = teacher_by_username(in_uname)
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

    if login_correct?(@user_dir_name, in_uname, in_psw, 0)
      @active_user = user_by_username(in_uname)
      @active_role = student_by_username(in_uname)
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

def login_correct?(dir_name, username, password, role_id)
  file = FilesHandler.new(dir_name)
  data = file.load_data.fetch('Users')
  data.each do |item|
    if username == item.fetch('username')
      return true if password == item.fetch('password') &&
          role_id == item.fetch('role_id')
    end
  end
  false
end

def user_by_username(username)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data.fetch('Users')
  data.each do |item|
    next unless username == item.fetch('username')
    user = User.new(user_hash(item.fetch('username'), item.fetch('password'),
                              item.fetch('name'), item.fetch('last_name'),
                              item.fetch('role'), item.fetch('email'),
                              item.fetch('phone')))
    return user
  end
end

def student_by_username(username)
  file = FilesHandler.new(@student_dir_name)
  data = file.load_data.fetch('Students')
  data.each do |item|
    s_id = item.fetch('s_id')
    next unless username == item.fetch('s_id')
    student = Student.new(s_id, item.fetch('group'),
                          item.fetch('study_program'),
                          item.fetch('subjects'))
    return student
  end
end

def teacher_by_username(username)
  file = FilesHandler.new(@teacher_dir_name)
  data = file.load_data.fetch('Teachers')
  data.each do |item|
    next unless username == item.fetch('username')
    teacher = Teacher.new(item.fetch('username'), item.fetch('university'),
                          item.fetch('faculty'))
    return teacher
  end
end