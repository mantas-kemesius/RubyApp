class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :time
      t.integer :teacher_id
      t.timestamps
    end
  end
end
