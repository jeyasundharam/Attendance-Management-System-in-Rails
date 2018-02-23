class CreateReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :reasons do |t|
      t.date :date
      t.string :reason

      t.timestamps
    end
  end
end
