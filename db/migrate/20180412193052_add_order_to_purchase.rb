class AddOrderToPurchase < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :order, foreign_key: true
  end
end
