class AddUniqueIndexToTableName < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :name, unique: true
    add_index :users, :email, unique: true
  end
end
