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

def emails_menu
  clear
  puts 'Emails'
  puts '[1] Compose an email'
  puts '[2] Inbox'
  puts '[3] Sent'
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

def email_used?(email)
  file = FilesHandler.new(@user_dir_name)
  data = file.load_data
  data.each do |item|
    return true if email == item.fetch('email')
  end
  false
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
