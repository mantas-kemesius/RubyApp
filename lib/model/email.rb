require_relative 'email_info'
# Email class implements email functionality
class Email < EmailInfo
  attr_reader :title, :text, :email_to

  def initialize(email_to, title, text)
    @email_to = email_to
    @title = title
    @text = text
  end
end
