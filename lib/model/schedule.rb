require_relative '../../lib/helpers/files_handler'
require 'json'
# Study Schedule class
class Schedule
  attr_reader :date_day, :date_time, :class_number, :subject_name
  def initialize(date, class_number, info)
    @date_day = date.fetch('day')
    @date_time = date.fetch('time')
    @class_number = class_number
    @subject_name = info.fetch('subject')
    # @teacher_id = info.fetch('teacher')
  end

  def print_day(data, day_number)
    puts "WEEK DAY #{day_number}"
    data.each do |item|
      next unless item.fetch('date_day').to_i == day_number.to_i
      puts '##############################'
      print_objects_day(item)
    end
  end

  def print_week(data)
    data.each do |item|
      (0..5).each {|rip|
        next unless item.fetch('date_day').to_i == rip
        puts '##############################'
        print_objects(item)
      }
    end
  end

  def print_objects(item)
    puts "TIME #{item.fetch('date_time')}"
    puts "CLASSROOM #{item.fetch('class_number')}"
    puts "SUBJECT #{item.fetch('subject_name')}"
    puts "TEACHER #{item.fetch('teacher_id')}"
  end

  def print_objects_day(item)
    puts "WEEK DAY #{item.fetch('date_day')}"
    puts "TIME #{item.fetch('date_time')}"
    puts "CLASSROOM #{item.fetch('class_number')}"
    puts "SUBJECT #{item.fetch('subject_name')}"
    puts "TEACHER #{item.fetch('teacher_id')}"
  end
end
