require_relative 'User'

class Student < User

  def sayMyName
    puts @name
  end
end