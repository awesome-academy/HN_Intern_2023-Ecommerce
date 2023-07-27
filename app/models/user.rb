class User < ApplicationRecord
  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  enum role: {
    customer: 0,
    seller: 1
  }

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :name, :email, :phone, :address, :date_of_birth,
            :gender, :activated, :role, presence: true
  validates :email, uniqueness: true

  validates :name, length: {maximum: Settings.digit.length_60}
  validates :phone, length: {maximum: Settings.digit.length_15}
  validates :address, length: {maximum: Settings.digit.length_140}

  validates :email, format: {with: /#{Settings.regex.email}/}
  validates :phone, format: {with: /#{Settings.regex.phone}/}

  validates :gender, inclusion: {in: User.genders.keys}
  validates :activated, inclusion: {in: [true, false]}
  validates :role, inclusion: {in: User.roles.keys}
end