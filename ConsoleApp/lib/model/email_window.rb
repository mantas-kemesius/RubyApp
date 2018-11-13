class EmailWindow
  attr_reader :emails, :files_handler

  def initialize(file_path)
    @emails = []
    @files_handler = FilesHandler.new(file_path)
  end

  def add_email_by_obj(email)
    @emails << email
  end

  def add_email_by_args(email_to, email_from, title, text)
    email_hash = Email.return_email_hash(Date.today.to_s, email_to,
                                         email_from, title, text)
    @emails << Email.new(email_hash)
  end

  def add_email_by_hash(email_hash)
    @emails << Email.new(email_hash)
  end

  def delete_email(position)
    @emails.delete_at(position)
  end

  def print_emails
    @emails.each(&:print_email)
  end
  # :reek:FeatureEnvy

  def save_emails
    data = []
    @emails.each do |email|
      data[data.length] = {
        date: email.date,
        email_to: email.email_to, email_from: email.email_from,
        title: email.title, text: email.text
      }
      @files_handler.save_data(data)
    end
  end

  # :reek:FeatureEnvy
  def load_emails
    data = @files_handler.load_data
    data.each do |email|
      add_email_by_hash(email)
    end
  end
end
