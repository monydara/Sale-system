class ReportCustomersController < ApplicationController
  def index
    @data = Customer.joins(:customer_type,:custom_price, :contact )
    @data = @data.select("customers.* ,
      customer_types.name customer_type_name ,
      custom_prices.name custom_price_name,
      contacts.contact_name
      ")

    render json:{data:@data , success:true}
  end
end
