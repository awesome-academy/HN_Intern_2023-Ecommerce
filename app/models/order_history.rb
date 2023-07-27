class OrderHistory < ApplicationRecord
  enum status: {
    pending: 0,
    shipped: 1,
    delivered: 2,
    canceled: 3
  }

  belongs_to :order

  validates :status, :update_date, presence: true
  validates :status, inclusion: {in: OrderHistory.statuses.keys}
end
