class CustomersController < ApplicationController
  def create

    customer_params = params[:customer]
    customer_params.permit!

    @customer = Customer.new(customer_params)
    if @customer.save
      # success
    else
      # Error handling
    end

    redirect_to root_url
  end

end