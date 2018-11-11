# frozen_string_literal: true

require 'json'

# Files Handler class
class FilesHandler
  def initialize(dir_name)
    @path_name = dir_name
  end

  def load_data
    JSON.parse(File.read(
                 @path_name
               ))
  end

  def save_data(data)
    full_path = @path_name
    File.open(
      full_path, 'w'
    ) do |file|
      file.write(JSON.pretty_generate(data))
    end
    File.exist?(full_path)
  end

  def delete_file
    full_path = @path_name
    File.delete(full_path)
    !File.exist?(full_path)
  end
end
