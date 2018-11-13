require_relative '../../lib/helpers/files_handler'
# Email class implements email functionality
class Email < EmailInfo
  attr_reader :date, :email_to, :email_from, :title
  def initialize(email_hash)
    super(email_hash.fetch('text'))
    title_init = email_hash.fetch('title')
    date_init = email_hash.fetch('date')
    email_to_init = email_hash.fetch('email_to')
    email_from_init = email_hash.fetch('email_from')
    @title = title_init if title_init.instance_of?(String)
    @date = date_init if date_init.instance_of?(String)
    @email_to = email_to_init if email_to_init.instance_of?(String)
    @email_from = email_from_init if email_from_init.instance_of?(String)
    # super(email_hash.fetch('title'), email_hash.fetch('text'))
    # date_init = email_hash.fetch('date')
    # email_to_init = email_hash.fetch('email_to')
    # email_from_init = email_hash.fetch('email_from')
    # @date = date_init if date_init.instance_of?(String)
    # @email_to = email_to_init if email_to_init.instance_of?(String)
    # @email_from = email_from_init if email_from_init.instance_of?(String)
  end

  # def self.return_email_hash(date, email_to, email_from, title, text)
  #   {
  #     'date' => date,
  #     'email_to' => email_to,
  #     'email_from' => email_from,
  #     'title' => title,
  #     'text' => text
  #   }
  # end

  def return_email
    {
      'date' => @date,
      'email_to' => @email_to,
      'email_from' => @email_from,
      'title' => title,
      'text' => text
    }
  end

  def print_email
    puts
    puts '------------------'
    print_header
    print_content
  end

  def print_header
    puts
    puts 'FROM: ' + @email_from
    puts 'TO: ' + @email_to
    puts 'DATE: ' + @date
    puts 'TITLE: ' + @title
  end

  def change_email_to(email_to_new)
    @email_to = email_to_new if email_to_new.instance_of?(String)
  end

  def change_email_from(email_from_new)
    @email_from = email_from_new if email_from_new.instance_of?(String)
  end
end
