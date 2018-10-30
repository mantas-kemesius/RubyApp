require_relative 'text'
# Notification class for all users
class Notification < Text
  attr_reader :date, :sender
  def initialize(date, title, text, sender)
    super(title, text)
    @date = date
    @sender = sender
  end

  def print_notification
    str = date + "\n" + title + "\n" + text + "\n" + sender
    print str
  end

  def change_date(date)
    @date = date
  end

  def change_title(title)
    @title = title
  end

  def change_text(text)
    @text = text
  end

  def change_sender(sender)
    @sender = sender
  end
end
