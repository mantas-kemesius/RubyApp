require_relative '../lib/model/subject_window'

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
      #Subject.new(title, desc, credits, @active_user.name + ' ' + @active_user.last_name)
    Subject.new(title, desc, credits, 'Change this')
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

def subjects_menu
  clear
  puts '[1] Show all subjects(any)'
  puts '[2] Show my subjects(Teacher)'
  puts '[3] Show my subjects(Student)'
  puts '[4] Add subject(Teacher, admin)'
  puts '[5] Join subject(Student)'
  puts '[6] Delete my subjects(Teacher)'
  puts '[7] Delete subjects(Admin)'
  puts '[0] Back'
end

def start_subjects
  subjects = SubjectWindow.new
  subjects.load_subjects(
      '../fakeDatabase/Subjects.json'
  )
  loop do
    clear
    subjects_menu
    input = gets.chomp
    case input
    when '1'
      clear
      subjects.print_subjects
      pause
    when '2'
      clear
      #subjects.print_subjects_by_teacher(@active_user.name + ' ' + @active_user.last_name)
      subjects.print_subjects_by_teacher('Change this')
      pause
    when '3'
      clear
      #TODO add func
      # subjects.print_subjects_by_Student('Change this')
      pause
    when '4'
      subject_add(subjects)
    when '5'
      #TODO add func
      # add_student_subject('Change this')
    when '6'
      subjects.delete_by_title_by_teacher('ss', 'Change this')
    when '7'
      subjects.delete_by_title('ss')
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

start_subjects