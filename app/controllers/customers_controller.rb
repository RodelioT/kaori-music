class CustomersController < ApplicationController
  def create
    customer_params = params[:customer]
    customer_params.permit!
    customer = Customer.new(customer_params)

    # Inserts a Customer into the database
    customer.save

    calculate_subtotal

    # Creates a session variable for the taxrate
    session[:taxrate] = customer.province.taxRate

    # Inserts a Order into the database, and associates it to the Customer
    order = customer.orders.create(subtotal: session[:subtotal],
                           purchaseTaxRate: session[:taxrate],
                           status: Status.find_by(name: "pending") )

    # Creates a session variable for the customer_id
    session[:customer_id] = order.id

    # Inserts a Purchase for each cart item and associates them to the Order
    session[:shopping_cart].each do |product|
      order.purchases.create(quantity: product["quantity"].to_i,
                             purchaseUnitPrice: Product.find(product["id"]).price,
                             order_id: order.id,
                             product_id: product["id"])
    end

    redirect_to carts_process_payment_path
  end

  private

  def calculate_subtotal
    session[:subtotal] = 0
    session[:shopping_cart].each do |product|
      session[:subtotal] += (Product.find(product["id"]).price * product["quantity"].to_i)
    end
  end

end
