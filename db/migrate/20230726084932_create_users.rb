class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.date :date_of_birth
      t.integer :gender
      t.boolean :activated
      t.integer :role

      t.timestamps
    end
  end
end
