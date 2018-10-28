require_relative 'text'
# Notification class for all users
class Notification < Text
  attr_reader :date, :sender
  def initialize(date, title, text, sender)
    super(title, text)
    @date = date
    @sender = sender
  end

  def print_notification?
    str = date + "\n" + title + "\n" + text + "\n"+ sender
    puts str
    str
  end
end
