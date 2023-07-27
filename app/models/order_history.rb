class OrderHistory < ApplicationRecord
  enum status: [:pending, :shipped, :delivered, :canceled]
  belongs_to :order

  validates :status, :update_date, presence: true
  validates :status, inclusion: { in: OrderHistory.statuses.keys }
end
