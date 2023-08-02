class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user

  delegate :name, :price, to: :product, prefix: true

  ATTRIBUTES = [:quantity, :product_id, :user_id].freeze
  validates :quantity, presence: true,
                       numericality: {
                         only_integer: true,
                         greater_than_or_equal_to: Settings.value.number_1
                       }

  scope :newest, ->{order(created_at: :desc)}
end
