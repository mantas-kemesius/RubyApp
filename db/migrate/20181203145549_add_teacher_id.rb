class AddTeacherId < ActiveRecord::Migration[5.2]
  def change
		change_table :subjects do |t|
  		t.index :teacher_id
		end
	end
end
