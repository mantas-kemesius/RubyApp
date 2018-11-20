require_relative '../../lib/helpers/files_handler'
require_relative 'email_info'

# Email class implements email functionality
class Email < EmailInfo
  attr_reader :date, :email_to, :email_from, :title
  def initialize(email_hash)
    super(email_hash.fetch('text'))
    title_init = email_hash.fetch('title')
    date_init = email_hash.fetch('date')
    email_to_init = email_hash.fetch('email_to')
    email_from_init = email_hash.fetch('email_from')
    @title = title_init if title_init.instance_of?(String)
    @date = date_init if date_init.instance_of?(String)
    @email_to = email_to_init if email_to_init.instance_of?(String)
    @email_from = email_from_init if email_from_init.instance_of?(String)
  end

  def return_email
    {
      date: date,
      email_to: email_to,
      email_from: email_from,
      title: title,
      text: text
    }
  end

  def print_email
    print email_header + email_content
  end

  def change_email_to(email_to_new)
    @email_to = email_to_new if email_to_new.instance_of?(String)
  end

  def change_email_from(email_from_new)
    @email_from = email_from_new if email_from_new.instance_of?(String)
  end

  private

  def email_header
    "\n\n------------------\n\nFROM: " + email_from +
      "\nTO: " + email_to + "\nDATE: " + date
  end

  def email_content
    "\nTITLE: " + title + "\n\n" + text + "\n"
  end
end
