# frozen_string_literal: true

# Class of student grades
class Grades
  attr_reader :student_id, :study_subject, :teacher_id, :grade
  def initialize(student_id, study_subject, teacher_id, grade)
    @student_id = student_id
    @study_subject = study_subject
    @teacher_id = teacher_id
    @grade = grade
  end
end
