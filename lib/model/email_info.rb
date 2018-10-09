# For email attributes
class EmailInfo
  attr_reader :email_from, :email_to

  def initialize(email_from, email_to)
    @email_from = email_from
    @email_to = email_to
  end
end
