class CreateAttendences < ActiveRecord::Migration[5.1]
  def change
    create_table :attendences do |t|
      t.string :rno
      t.integer :present
      t.integer :absent
      t.integer :total

      t.timestamps
    end
    add_index :attendences, :rno, unique: true
  end
end
