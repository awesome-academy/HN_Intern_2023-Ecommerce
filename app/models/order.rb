class Order < ApplicationRecord
  enum status: {
    pending: 0,
    shipped: 1,
    delivered: 2,
    canceled: 3
  }

  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :order_histories, dependent: :destroy

  validates :receiver_name, :receiver_phone, :receiver_address, :order_date,
            :total_amount, :status, presence: true

  validates :total_amount,
            numericality: {greater_than_or_equal_to: Settings.value.number_0}

  validates :receiver_name, length: {maximum: Settings.digit.length_60}
  validates :receiver_phone, length: {maximum: Settings.digit.length_15}
  validates :receiver_address, length: {maximum: Settings.digit.length_140}
  validates :status, length: {maximum: Settings.digit.length_30}

  validates :status, inclusion: {in: Order.statuses.keys}
end
