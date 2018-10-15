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
    Email.get_received_emails(email, email_file_name, 'Users')
  end

  # @return [Email]
  def sent_emails(email_file_name)
    Email.get_sent_emails(email, email_file_name, 'Users')
  end

  def received_email_count(email_file_name)
    received_emails(email_file_name).count
  end

  def sent_email_count(email_file_name)
    sent_emails(email_file_name).count
  end

  # Searches fakeDatabase for User with given username
  # Returns user object if found
  # Returns empty user object if not found
  def self.get_user_by_username(username, file_name)
    files_handler = FilesHandler.new

    data = files_handler.load_data(file_name)
    data['Users'].each do |user|
      if user['username'] == username
        return User.new(user['name'], user['last_name'],
                        user['role_id'], user['email'], user['phone'])
      end
    end
    User.new('', '', 0, '', '')
  end

  # Searches fakeDatabase for User with given email
  # Returns user object if found
  # Returns empty user object if not found
  def self.get_user_by_email(email, file_name)
    files_handler = FilesHandler.new

    data = files_handler.load_data(file_name)
    data['Users'].each do |user|
      temp_user_email = user['email']
      if temp_user_email == email
        return User.new(user['name'], user['last_name'],
                        user['role_id'], temp_user_email, user['phone'])
      end
    end
    User.new('', '', 0, '', '')
  end
end
