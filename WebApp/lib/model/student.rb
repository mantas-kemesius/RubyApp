# frozen_string_literal: true

require_relative '../../lib/helpers/files_handler'
require 'json'
require_relative 'student_info'
# Description/Explanation of Student class
class Student < StudentInfo
  attr_reader :s_id, :group, :faculty, :study_program

  def initialize(student)
    super(student)
    init_s_id = student.fetch('s_id')
    @s_id = init_s_id
    init_group = student.fetch('group')
    @group = init_group if init_group.positive?
    @faculty = student.fetch('faculty')
    @study_program = student.fetch('study_program')
  end

  def change_group(new_group)
    @group = new_group if new_group.positive?
  end

  def change_faculty(new_faculty)
    @faculty = new_faculty
  end

  def change_study_program(new_study_program)
    @study_program = new_study_program
  end

  def change_sid(new_s_id)
    @s_id = new_s_id
  end

  def save_student(path_to_db)
    file = FilesHandler.new(path_to_db)
    file.save_data(
      's_id' => s_id,
      'group' => group,
      'faculty' => faculty,
      'study_program' => study_program,
      'subjects' => subjects,
      'active' => active,
      'mode' => mode
    )
  end

  def load_student(path_to_db)
    file = FilesHandler.new(path_to_db)
    initialize(file.load_data)
  end
end
