class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :order_items, dependent: :destroy
  validates :name, :price, :description, :quantity_on_stock, presence: true

  validates :price,
            numericality: {greater_than_or_equal_to: Settings.value.number_0}
  validates :quantity_on_stock,
            numericality: {only_integer: true,
                           greater_than_or_equal_to: Settings.value.number_0}

  validates :name, length: {maximum: Settings.digit.length_30}
  validates :description, length: {maximum: Settings.digit.length_1000}
end
