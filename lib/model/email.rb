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

    user_to = User.get_user_by_email(email_to, 'Users')

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

  # Searches fakeDatabase for Emails sent by a user
  # Returns email objects array
  # Returns array with an empty email object
  def self.get_sent_emails(user_email, email_file_name, user_file_name)
    files_handler = FilesHandler.new
    user = User.get_user_by_email(user_email, user_file_name)
    return [Email.new('', '', '', '')] if user.email == ''

    data = files_handler.load_data(email_file_name)

    inflate_sent_email_array(user_email, data)
  end

  def self.inflate_sent_email_array(user_email, data)
    email_array = []
    data.each do |email|
      temp_email_from = email['email_from']
      if temp_email_from == user_email
        email_array << Email.new(temp_email_from, email['email_to'],
                                 email['title'], email['text'])
      end
    end
    email_array
  end

  # Searches fakeDatabase for Emails received by a user
  # Returns email objects array
  # Returns array with an empty email object
  def self.get_received_emails(user_email, email_file_name, user_file_name)
    files_handler = FilesHandler.new

    user = User.get_user_by_email(user_email, user_file_name)
    return [Email.new('', '', '', '')] if user.email == ''

    data = files_handler.load_data(email_file_name)

    inflate_received_email_array(user_email, data)
  end

  def self.inflate_received_email_array(user_email, data)
    email_array = []
    data.each do |email|
      temp_email_to = email['email_to']
      if temp_email_to == user_email
        email_array << Email.new(email['email_from'], temp_email_to,
                                 email['title'], email['text'])
      end
    end
    email_array
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
