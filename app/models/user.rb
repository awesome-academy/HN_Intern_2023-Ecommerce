class User < ApplicationRecord
  before_save :downcase_email

  ATTRIBUTES = [:name, :email, :phone, :address, :date_of_birth, :gender,
                :role, :password, :password_confirmation].freeze

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
  has_many :cart_items, dependent: :destroy

  validates :name, :email, :phone, :address, :date_of_birth, :gender, :role,
            :password, presence: true
  validates :email, uniqueness: true

  validates :name, length: {maximum: Settings.digit.length_60}
  validates :phone, length: {maximum: Settings.digit.length_15}
  validates :address, length: {maximum: Settings.digit.length_140}

  validates :email, format: {with: /#{Settings.regex.email}/}
  validates :phone, format: {with: /#{Settings.regex.phone}/}

  validates :gender, inclusion: {in: User.genders.keys}
  validates :role, inclusion: {in: User.roles.keys}

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
