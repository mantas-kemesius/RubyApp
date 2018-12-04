class AddUserfour < ActiveRecord::Migration[5.2]
  def change
  	change_table :mails do |t|
  	t.index :to_id
		t.index :from_id
		end
		change_table :users do |t|
  	t.index :to_emails_id
		t.index :from_emails_id
  	end
  end
end
