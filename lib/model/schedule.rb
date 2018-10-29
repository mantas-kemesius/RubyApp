require_relative './schedule_info'
# Study Schedule class
class Schedule < ScheduleInfo
  attr_reader :date_day, :date_time
  def initialize(date_day, date_time, class_number, subject_name, teacher_id)
    @date_day = date_day
    @date_time = date_time
    super(class_number, subject_name, teacher_id)
    @file_handler = FilesHandler.new('fakeDatabase/Schedule.json')
  end
end
