class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :rno
      t.string :studentname
      t.string :gender
      t.string :studentclass
      t.string :department
      t.bigint :mobileno
      t.string :gmail
      t.date :dob

      t.timestamps
    end
    add_index :students, :rno, unique: true
  end
end
