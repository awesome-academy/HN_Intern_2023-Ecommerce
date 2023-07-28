class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :reciever_name
      t.string :reciever_phone
      t.string :reciever_address
      t.date :order_date
      t.decimal :total_amount
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
