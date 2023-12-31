class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|
      t.string :status
      t.date :update_date
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
