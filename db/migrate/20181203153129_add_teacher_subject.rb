class AddTeacherSubject < ActiveRecord::Migration[5.2]

  def change
		change_table :teachers do |t|
  		t.integer :subject_id
		end
	end
end
