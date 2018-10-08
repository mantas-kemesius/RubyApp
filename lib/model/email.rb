# Email class implements email functionality
class Email < EmailInfo
  attr_reader :email_from, :email_to, :title, :text
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.a_valid_email?(email)
    if (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i).nil?
      false
    else
      true
    end
  end

  def initialize(email_from, email_to, title, text = '')
    @email_from = email_from
    @email_to = email_to
    @title = title
    @text = text
  end

  def send
    true
  end
end
