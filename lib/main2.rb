require_relative '../lib/model/notification_window'

def menu
  puts '[1] Show notifications'
  puts '[2] Add notification'
  puts '[3] Delete notification'
  puts '[4] Send email'
  puts '[5] Show all emails'
  puts '[6] Show all emails for...'
  puts '[7] Show all emails from...'
  puts '[0] Exit from program'
end

def print_notifications
  notifications = NotificationWindow.new
  notifications.load_notifications(
    '../fakeDatabase/testFiles/Notifications.json'
  )
  notifications.print_notifications
end

def add_and_save_notification
  notifications = NotificationWindow.new
  notifications.add_notification(
    Notification.new('2018-10-30', 'Pavadinimas',
                     'kazkoks tekstas', 'Tomas')
  )
  notifications.save_notifications(
    '../fakeDatabase/testFiles/Notifications.json'
  )
end

def print_all_emails
  file = FilesHandler.new('fakeDatabase/Emails.json')
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
  file = FilesHandler.new('fakeDatabase/Emails.json')
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
  file = FilesHandler.new('fakeDatabase/Emails.json')
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
  file = FilesHandler.new('fakeDatabase/Emails.json')
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

def start
  loop do
    menu
    print 'Choose: '
    input = gets.chomp
    case input
    when '1'
      print_notifications
    when '2'
      add_and_save
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
      break
    end
  end
end

start
