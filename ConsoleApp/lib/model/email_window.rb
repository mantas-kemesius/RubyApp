require_relative 'email'
require_relative '../../lib/helpers/files_handler'

# All notifications
class EmailWindow
  attr_reader :emails

  def initialize
    @emails = []
  end

  def add_email(email)
    emails << email
  end

  def delete_email(position)
    emails.delete_at(position)
  end

  # :reek:FeatureEnvy

  def save_emails(path)
    file = FilesHandler.new(path)
    data = []
    emails.each do |email|
      data[data.length] = {
        'email_to' => email.email_to, 'email_from' => email.email_from,
        'title' => email.title, 'text' => email.text
      }
      file.save_data('Emails' => data)
    end
  end

  def delete_all
    @emails = []
  end

  # :reek:FeatureEnvy
  def load_emails(path)
    delete_all
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Emails')
    info.each do |email|
      add_email(Email.new(email.fetch('email_to'),
                          email.fetch('email_from'),
                          email.fetch('title'),
                          email.fetch('text')))
    end
  end

  def append_email(email, path)
    load_emails(path)
    add_email(email)
    save_emails(path)
  end
end
