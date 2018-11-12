require_relative '../../lib/helpers/files_handler'
# Email class implements email functionality
class Email
  attr_reader :email_to, :email_from, :title, :text
  def initialize(email_to, email_from, title, text)
    @email_to = email_to if email_to.instance_of?(String)
    @email_from = email_from if email_from.instance_of?(String)
    @title = title if title.instance_of?(String)
    @text = text if text.instance_of?(String)
  end

  def return_email
    {
      'email_to' => email_to,
      'email_from' => email_from,
      'title' => title,
      'text' => text
    }
  end

  def change_email_to(email_to_new)
    @email_to = email_to_new if email_to_new.instance_of?(String)
  end

  def change_email_from(email_from_new)
    @email_from = email_from_new if email_from_new.instance_of?(String)
  end

  def change_text(text_new)
    @text = text_new if text_new.instance_of?(String)
  end

  def change_title(title_new)
    @title = title_new if title_new.instance_of?(String)
  end
end
