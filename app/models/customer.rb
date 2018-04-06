class Customer < ApplicationRecord
  validates :name, :address, :city, :postalCode, presence: true

  belongs_to :province
end
