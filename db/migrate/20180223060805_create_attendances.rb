class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :present
      t.integer :absent
      t.integer :total
      t.references :student, foreign_key: true
 
      t.timestamps
    end
  end
end
