class AddStudentDestroyable < ActiveRecord::Migration[5.2]
  def change
  	change_table :students do |t|
			t.boolean :destroyable, default: false
		end
  end
end
