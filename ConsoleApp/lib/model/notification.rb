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
    str = date + "\n" + title + "\n" + text + "\n" + sender + "\n"
    str += '____________________________________________________' + "\n"
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

  def ==(other)
    ret_value = date.eql?(other.date) && title.eql?(other.title)
    ret_value && text.eql?(other.text) && sender.eql?(other.sender)
  end
end
