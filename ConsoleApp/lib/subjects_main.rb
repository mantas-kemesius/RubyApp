require_relative '../lib/model/subject_window'
require_relative '../lib/model/user'
require_relative '../lib/model/student'
require 'io/console'

@active_user = User.new('Antanas', 'Smetona', 1, 'Antanas.Smetona@smetona.lt', '+37011122333')
@active_student = Student.new('s123', 10, 'Info', 'Ruby')
@active_role = 'ROLE_STUDENT'

def clear
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def pause
  print 'press any key'
  STDIN.getch
  print "                          \r"
end

def start_subjects_teacher
  subjects = SubjectWindow.new
  subjects.load_subjects(
      '../fakeDatabase/Subjects.json'
  )
  loop do
    clear
    subjects_menu_teacher
    input = gets.chomp
    case input
    when '1'
      clear
      subjects.print_subjects
      pause
    when '2'
      clear
      subjects.print_subjects_by_teacher(@active_user.name + ' ' + @active_user.last_name)
      pause
    when '3'
      subject_add(subjects)
    when '4'
      delete_subject_by_teacher(subjects)
    when '0'
      break
    else
      'Incorrect input. Choose again'
    end
  end
  subjects.save_subjects(
      '../fakeDatabase/Subjects.json'
  )
end

def subjects_menu_teacher
  clear
  puts '[1] Show all subjects'
  puts '[2] Show my subjects'
  puts '[3] Add subject'
  puts '[4] Delete my subjects'
  puts '[0] Back'
end

def start_subjects_student
  subjects = SubjectWindow.new
  subjects.load_subjects(
      '../fakeDatabase/Subjects.json'
  )
  loop do
    clear
    subjects_menu_student
    input = gets.chomp
    case input
    when '1'
      clear
      subjects.print_subjects
      pause
    when '2'
      clear
      subjects.print_subjects_by_student(@active_student.subjects)
      pause
    when '3'
      clear
      subjects.print_subjects
      input = gets.chomp
      @active_student.add_subjects(input)
    when '0'
      break
    else
      'Incorrect input. Choose again'
    end
  end
  subjects.save_subjects(
      '../fakeDatabase/Subjects.json'
  )
end

def subjects_menu_student
  clear
  puts '[1] Show all subjects'
  puts '[2] Show my subjects(Student)'
  puts '[3] Enroll to subject'
  puts '[0] Back'
end

def subject_add(subjects)
  clear
  print 'Title: '
  title = gets.chomp
  return if title == '0'
  print 'Description: '
  desc = gets.chomp
  return if desc == '0'
  print 'Credits: '
  credits = gets.chomp
  return if credits == '0'
  subjects.add_subject(
    Subject.new(title, desc, credits, @active_user.name + ' ' + @active_user.last_name)
  )
  puts 'Subject has been added successfully'
  puts ''
end

def subject_del(subjects)
  clear
  print 'At position '
  position = gets.chomp
  return if position == '0'
  puts subjects.subjects.length
  if position.to_i <= subjects.subjects.length
    subjects.delete_subject(position.to_i-1)
  else
    puts 'Incorrect index'
  end
end

def delete_subject_by_teacher(subjects)
  clear
  print 'Enter subject title: '
  title = gets.chomp
  return if title == '0'
  subjects.delete_by_title_by_teacher(title, @active_user.name + ' ' + @active_user.last_name)
end

def delete_subject_by_title(subjects)
  clear
  print 'Enter subject title: '
  title = gets.chomp
  return if title == '0'
  subjects.delete_by_title(title)
end




