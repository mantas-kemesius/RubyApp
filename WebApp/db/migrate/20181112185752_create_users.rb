class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :username
      t.string :password
      t.integer :age
      t.string :university
      t.string :role

      t.timestamps
    end
  end
end