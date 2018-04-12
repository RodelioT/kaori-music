class Purchase < ApplicationRecord
  validates :quantity, :purchaseUnitPrice, presence: true
  validates :quantity, :purchaseUnitPrice, uniqueness: true

  belongs_to :product
  belongs_to :order
end
