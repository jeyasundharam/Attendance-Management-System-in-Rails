class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :doorno
      t.string :street
      t.string :area
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.integer :pincode
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
