require 'json'
class FilesHandler
  attr_accessor :full_path
  def initialize(full_path)
    @full_path = full_path
  end

  def load_data(file_name)
    JSON.parse(File.read(@full_path + '/fakeDatabase/' + file_name + '.json'))
  end
end
