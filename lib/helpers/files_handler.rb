require 'json'

# Files Handler class
class FilesHandler
  attr_reader :full_path
  def initialize
    @full_path = __dir__ + '/../../fakeDatabase/'
  end

  def load_data(file_name)
    JSON.parse(File.read(@full_path + file_name + '.json'))
  end

  def save_data(data, file_name)
    File.open(@full_path + file_name + '.json', 'w') do |f|
      f.write(JSON.pretty_generate(data))
    end
  end

  def append_data(data, file_name)
    json_data = load_data(file_name)
    json_data << data
    save_data(json_data, file_name)
  end

  def delete_file(file_name)
    File.delete(@full_path + file_name + '.json')
  end

  def file_exist?(file_name)
    File.exist?(@full_path + file_name + '.json')
  end

  # Searches fakeDatabase for User with given username
  # Returns user object if found
  # Returns empty user object if not found
  def get_user_by_username(username, file_name)
    data = load_data(file_name)
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
  def get_user_by_email(email, file_name)
    data = load_data(file_name)
    data['Users'].each do |user|
      if user['email'] == email
        return User.new(user['name'], user['last_name'],
                        user['role_id'], user['email'], user['phone'])
      end
    end
    User.new('', '', 0, '', '')
  end

  # Searches fakeDatabase for Emails sent to a user
  # Returns email objects array
  # Returns array with an empty email object
  def get_user_emails(user_email, email_file_name, user_file_name)
    user = get_user_by_email(user_email, user_file_name)
    return [Email.new('', '', '', '')] if user.email == ''

    data = load_data(email_file_name)

    inflate_email_array(user_email, data)
  end

  def inflate_email_array(user_email, data)
    email_array = []
    data.each do |email|
      if email['email_to'] == user_email
        email_array << Email.new(email['email_from'], email['email_to'],
                                 email['title'], email['text'])
      end
    end
    email_array
  end

  def get_email_count(file_name)
    load_data(file_name).count
  end
end
