class Order < ApplicationRecord
  validates :subtotal, :purchaseTaxRate, presence: true

  belongs_to :status
  belongs_to :customer

  has_many :purchases

  # def subtotal(id)
  #   total = 0
  #   Purchase.where(order_id: id).each do |purchase|
  #     total += purchase.purchaseUnitPrice * purchase.quantity
  #   end
  #   total
  # end
  #
  # def taxes(id)
  #   total = subtotal(id)
  #   tax = Order.find(id).customer.province.taxRate
  #   total * tax
  # end
  #
  # def grand_total(id)
  #   subtotal(id) + taxes(id)
  # end

end
