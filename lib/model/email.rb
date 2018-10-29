# Email class implements email functionality
class Email
  attr_reader :email_to, :email_from
  def initialize(email, title, text)
    @email_to = email.fetch('to')
    @email_from = email.fetch('from')
    @title = title
    @text = text
    @file_handler = FilesHandler.new('fakeDatabase/Emails.json')
  end

  def send_email
    emails = load_emails
    email = load_email_data
    if email_valid?(email)
      emails[emails.length] = email
      save_emails(emails)
    else
      false
    end
  end

  def load_email_data
    {
      'email_from' => @email_from,
      'email_to' => @email_to,
      'title' => @title,
      'text' => @text
    }
  end

  # @return boolean
  def email_valid?(email)
    if check_or_string_valid?(email['email_to']) &&
       check_or_string_valid?(email['email_from']) &&
       check_or_string_valid?(email['text']) &&
       check_or_string_valid?(email['title'])
      true
    else
      false
    end
  end

  def check_or_string_valid?(val)
    val != '' && !val.nil? && val.is_a?(String)
  end

  def check_or_array(data)
    data.is_a?(Array) && data.instance_of?(Array)
  end

  def delete_email(number)
    emails = load_emails
    if number_is_right?(number) &&
       number < emails.length &&
       emails.is_a?(Array) &&
       !emails.empty?
      emails.delete_at(number)
      save_emails(emails)
    end
  end

  def save_emails(data)
    @file_handler.save_data(data)
    emails = load_emails
    emails.at(emails.length - 1).eql?(load_email_data)
  end

  def load_emails
    emails = @file_handler.load_data
    if check_or_array(emails)
      emails
    else
      @file_handler.save_data([])
      []
    end
  end

  def number_is_right?(number)
    number.is_a?(Integer) && number >= 0 && number < 10_000
  end
end
