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

  # @return [Email]
  def emails
    files_handler = FilesHandler.new
    files_handler.get_user_emails(email, 'Emails', 'Users')
  end
end
