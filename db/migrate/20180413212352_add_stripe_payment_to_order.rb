class AddStripePaymentToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :stripePayment, :string
    add_column :orders, :stripeCustomer, :string
  end
end
