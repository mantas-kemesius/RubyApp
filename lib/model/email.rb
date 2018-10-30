# Email class implements email functionality
class Email
  def initialize(email, title, text)
    @email_to = email.fetch('to')
    @email_from = email.fetch('from')
    @title = title
    @text = text
    @file_handler = FilesHandler.new('fakeDatabase/Emails.json')
  end

  def send_email
    if email_valid?
      save_emails(add_email_to_email_list)
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

  def add_email_to_email_list
    load_emails.push(load_email_data)
  end

  # @return boolean
  def email_valid? # -
    email = load_email_data
    if check_or_string_valid?(email.fetch('email_to')) &&
       check_or_string_valid?(email.fetch('email_from')) &&
       check_or_string_valid?(email.fetch('text')) &&
       check_or_string_valid?(email.fetch('title'))
      true
    else
      false
    end
  end

  def check_or_string_valid?(val)
    val.instance_of?(String)
  end

  def check_or_array(data)
    data.instance_of?(Array)
  end

  def delete_email(email) # -
    @file_handler.save_data(load_emails.delete(email))
    data = load_emails
    !data.include?(email)
  end

  def save_emails(data) # -
    if data.include?(load_email_data)
      @file_handler.save_data(data)
    else
      false
    end
  end

  def load_emails # -
    emails = @file_handler.load_data
    if check_or_array(emails)
      emails
    else
      @file_handler.save_data([])
      []
    end
  end

  def number_is_right?(number)
    number.instance_of?(Integer)
  end
end
