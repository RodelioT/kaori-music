class ChargesController < ApplicationController
  def new
    @amount = 500 # $5.00 in cents
    @description = 'Description of Charge'
  end

  def create
    # Amount in cents
    amount = 500 # TODO: Change this to the actual amount (and also change the description!)

    @customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      customer: @customer.id,
      amount: amount,
      description: 'Rails Stripe customer',
      currency: 'cad'
    )

    # @customer.id will have the Stripe customer id, store it within the Order table
    # @charge.paid returns a boolean depending if the charge was successful

    if @charge.paid && @charge.amount == (session[:subtotal] * 100)
      
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
