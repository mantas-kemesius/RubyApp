class Email
  attr_accessor :email_from, :email_to, :title, :text
  @VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.a_valid_email?(email)
    if (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i).nil?
      false
    else
      true
    end
  end

  def initialize(email_from, email_to, title, text = '')
    @email_from = email_from
    @email_to = if Email.a_valid_email?(email_to)
                  email_to
                else
                  ''
                end
    @title = title
    @text = text
  end
end