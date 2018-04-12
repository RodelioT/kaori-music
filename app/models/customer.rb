class Customer < ApplicationRecord
  validates :name, :email, :address, :city, :postalCode, presence: true
  validates :email, uniqueness: true

  belongs_to :province

  has_many :orders
end
