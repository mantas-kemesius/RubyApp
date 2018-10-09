require_relative 'email_info'
# Email class implements email functionality
class Email < EmailInfo
  attr_reader :is_sent, :title, :text
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(email_from, email_to, title, text = '')
    super(email_from, email_to)
    @title = title
    @text = text
  end

  def send(email_file_name)
    files_handler = FilesHandler.new
    user_to = files_handler.get_user_by_email(email_to, 'Users')

    # guard clause
    return false if user_to.email == ''

    files_handler.append_data(prepare_for_json, email_file_name)
    true
  end

  # prepares email object for json processing
  def prepare_for_json
    {
      email_from: email_from,
      email_to: email_to,
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
