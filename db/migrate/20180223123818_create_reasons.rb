class CreateReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :reasons do |t|
      t.date :date
      t.string :reason
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
