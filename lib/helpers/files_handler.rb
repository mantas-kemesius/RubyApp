require 'json'

# Files Handler class
class FilesHandler
  attr_reader :full_path, :file_name
  def initialize(file_name)
    @file_name = file_name
    @full_path = __dir__ + '/../../fakeDatabase/'
  end

  def load_data
    JSON.parse(File.read(@full_path + @file_name + '.json'))
  end

  def save_data(data)
    File.open(@full_path + @file_name + '.json', 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
    true
  end

  def delete_file
    File.delete(@full_path + @file_name + '.json')
    true
  end

  def file_exist?
    File.exist?(@full_path + @file_name + '.json')
  end
end
