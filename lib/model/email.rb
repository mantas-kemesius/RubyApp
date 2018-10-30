require_relative '../../lib/helpers/files_handler'
# Email class implements email functionality
class Email
  attr_reader :email_to, :email_from, :title, :text
  def initialize(email)
    email_to_init = email.fetch('email_to')
    email_from_init = email.fetch('email_from')
    title_init = email.fetch('title')
    text_init = email.fetch('text')
    @email_to = email_to_init if email_to_init.instance_of?(String)
    @email_from = email_from_init if email_from_init.instance_of?(String)
    @title = title_init if title_init.instance_of?(String)
    @text = text_init if text_init.instance_of?(String)
  end

  def load_email(path_to_db)
    file = FilesHandler.new(path_to_db)
    initialize(file.load_data)
  end

  def save_email(path_to_db) # -
    file = FilesHandler.new(path_to_db)
    file.save_data(
      'email_to' => email_to,
      'email_from' => email_from,
      'title' => title,
      'text' => text
    )
  end

  def change_emails_to(email_to_new)
    @email_to = email_to_new if email_to_new.instance_of?(String)
  end

  def change_emails_from(email_from_new)
    @email_from = email_from_new if email_from_new.instance_of?(String)
  end

  def change_text(text_new)
    @text = text_new if text_new.instance_of?(String)
  end

  def change_title(title_new)
    @title = title_new if title_new.instance_of?(String)
  end

  def delete_email_file(path_to_db)
    file = FilesHandler.new(path_to_db)
    file.delete_file
  end

  def number_is_right?(number)
    number.instance_of?(Integer)
  end

  def check_or_array(data)
    data.instance_of?(Array)
  end

  def check_or_string_valid?(val)
    val.instance_of?(String)
  end
end
