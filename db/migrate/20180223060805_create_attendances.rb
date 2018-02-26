class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.float :present
      t.float :absent
      t.float :total
      t.references :student, foreign_key: true
 
      t.timestamps
    end
  end
end
