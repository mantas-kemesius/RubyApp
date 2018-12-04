class AddUserEmails < ActiveRecord::Migration[5.2]
  def change
		change_table :mails do |t|
  		t.remove :teacher_id, :student_id
		end
	end
end
