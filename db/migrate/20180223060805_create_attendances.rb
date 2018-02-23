class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :rno
      t.integer :present
      t.integer :absent
      t.integer :total

      t.timestamps
    end
    add_index :attendances, :rno, unique: true
  end
end
