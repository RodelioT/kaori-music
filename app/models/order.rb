class Order < ApplicationRecord
  validates :subtotal, :purchaseTaxRate, presence: true

  belongs_to :status
  belongs_to :customer

  has_many :purchases

end
