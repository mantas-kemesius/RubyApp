class AddUsertwo < ActiveRecord::Migration[5.2]
  def change
		change_table :mails do |t|
  		t.remove :to, :from
		end
	end
end
