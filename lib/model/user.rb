require_relative 'user_info'
# User class
class User < UserInfo
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_reader :email, :phone
  def initialize(name, last_name, role_id, email = '', phone = '')
    super(name, last_name, role_id)
    # @name = name
    # @last_name = last_name
    # @role = ROLE[role_id]
    @email = email
    @phone = phone
  end

  def send_email(email_to, title, text, email_file_name)
    # send email to receiver
    email_to = Email.new(email, email_to, title, text)
    return true if email_to.send(email_file_name)

    false
  end

  # @return [Email]
  def received_emails(email_file_name)
    files_handler = FilesHandler.new
    files_handler.get_received_emails(email, email_file_name, 'Users')
  end

  # @return [Email]
  def sent_emails(email_file_name)
    files_handler = FilesHandler.new
    files_handler.get_sent_emails(email, email_file_name, 'Users')
  end

  def received_email_count(email_file_name)
    received_emails(email_file_name).count
  end

  def sent_email_count(email_file_name)
    sent_emails(email_file_name).count
  end
end
