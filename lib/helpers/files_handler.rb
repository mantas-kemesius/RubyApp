require 'json'
class FilesHandler
  attr_accessor :full_path
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

  def delete_file(file_name)
    File.delete(@full_path + file_name + '.json')
  end

  def file_exist?(file_name)
    File.exist?(@full_path + file_name + '.json')
  end

  def get_username(file_name, username)
    data = load_data(file_name)
    data['Users'].each do |user|
      if user['username'] == username
        return User.new(user['name'], user['last_name'],
                        user['role_id'], user['email'], user['phone'])
      end
    end
    nil
  end

  def get_email(file_name, email)
    data = load_data(file_name)
    data['Users'].each do |user|
      if user['email'] == email
        return User.new(user['name'], user['last_name'],
                        user['role_id'], user['email'], user['phone'])
      end
    end
    nil
  end

end
