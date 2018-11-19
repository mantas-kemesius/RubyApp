class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :subjects, foreign_key: true
      t.datetime :time
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
