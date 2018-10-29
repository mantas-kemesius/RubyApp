# require_relative './schedule_info'
# Study Schedule class
class Schedule
  attr_reader :date_day, :date_time, :class_number, :subject_name, :teacher_id
  def initialize(date, class_number, info)
    @date_day = date.fetch('day')
    @date_time = date.fetch('time')
    @class_number = class_number
    @subject_name = info.fetch('subject')
    # @teacher_id = info.fetch('teacher')
    # @file_handler = FilesHandler.new('fakeDatabase/Schedule.json')
  end
end
