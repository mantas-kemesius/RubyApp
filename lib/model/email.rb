require_relative 'email_info'
# Email class implements email functionality
class Email < EmailInfo
  attr_reader :title, :text
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(email_from, email_to, title, text = '')
    super(email_from, email_to)
    @title = title
    @text = text
  end

  def send
    files_handler = FilesHandler.new
    user_to = files_handler.get_user_by_email(email_to, 'Users')

    # guard clause
    return false if user_to.name == ''

    files_handler.append_data(prepare_for_json(false), 'Emails')
    true
  end

  # prepares email object for json processing
  def prepare_for_json(is_sent)
    # sent = is_sent ? 'sent' : 'received'
    {
      email_from: email_from,
      email_to: email_to,
      was_sent: is_sent,
      title: title,
      text: text
    }
  end

  # commented because of reek error
  # def self.a_valid_email?(email)
  #   if (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i).nil?
  #     false
  #   else
  #     true
  #   end
  # end
end
