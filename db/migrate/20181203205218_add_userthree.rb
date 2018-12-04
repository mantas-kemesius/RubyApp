class AddUserthree < ActiveRecord::Migration[5.2]
  def change
		change_table :mails do |t|
  	t.integer :to_id, index: true, foreign_key: {to_table: :users}
		t.integer :from_id, index: true, foreign_key: {to_table: :users}
		end
		change_table :users do |t|
  	t.integer :to_emails_id, index: true, foreign_key: {to_table: :mails}
		t.integer :from_emails_id, index: true, foreign_key: {to_table: :mails}
  	end
  end
end
