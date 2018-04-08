class CustomersController < ApplicationController
  def create
    Customer.create(name:       params[:name],
                    email:      params[:email],
                    address:    params[:address],
                    city:       params[:city],
                    postalCode: params[:postalCode],
                    province:   params[:province_id])

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
