class CustomersController < ApplicationController
  def create

    @customer = Customer.new(params[:customer])
    @customer.save

    # Customer.create(name:       customer[:name],
    #                 email:      customer[:email],
    #                 address:    customer[:address],
    #                 city:       customer[:city],
    #                 postalCode: customer[:postalCode],
    #                 province:   customer[:province_id])

    # Customer.create(name:       'Jane Smith',
    #                 email:      'jsmith@gmail.com',
    #                 address:    '11 Adsum Drive',
    #                 city:       'Winnipeg',
    #                 postalCode: 'R2R 2E2',
    #                 province:   Province.first)

    # Customer.create(params[:customer])

    redirect_to root_url
  end

end
