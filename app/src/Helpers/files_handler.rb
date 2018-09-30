require 'json'
class FilesHandler
  attr_accessor :full_path
  def initialize
    @full_path = __dir__ + '/../..'
  end

  def load_data(file_name)
    JSON.parse(File.read(@full_path + '/fakeDatabase/' + file_name + '.json'))
  end

  def save_data(data, file_name)
    #Should be implemented
  end
end
