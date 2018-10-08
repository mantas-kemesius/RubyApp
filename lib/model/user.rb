class User
  ROLE = %w[ROLE_STUDENT ROLE_LECTURER ROLE_ADMIN].freeze
  attr_accessor :name, :last_name, :role, :email, :phone, :received_emails
  def initialize(name, last_name, role_id, email = '', phone = '')
    @name = name
    @last_name = last_name
    @role = ROLE[role_id]
    @email = if Email.a_valid_email?(email)
               email
             else
               ''
             end
    @phone = phone
    @received_emails = []
  end

  def send_email(email_to, title, text)
    # implement function to get user with an email 'email_to' from
    # fakeDatabase and send it the email
    email = Email.new(this.email, email_to, title, text)
    email.send()
  end

  def show_received_email(position)
    received_emails.each do
      puts
    end
  end
end
