class CreateStudyManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :study_managements do |t|

      t.timestamps
    end
  end
end
