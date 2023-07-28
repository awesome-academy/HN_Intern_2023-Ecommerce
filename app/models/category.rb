class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: Settings.digit.length_60}
  validates :description, presence: true, length: {maximum: Settings.digit.length_1000}
end
