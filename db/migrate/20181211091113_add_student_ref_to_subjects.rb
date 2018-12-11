class AddStudentRefToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :student, foreign_key: true
  end
end
