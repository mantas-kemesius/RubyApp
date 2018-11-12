class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :age
      t.string :university
      t.text :bio

      t.timestamps
    end
  end
end
