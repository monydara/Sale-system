class ReportCustomersController < ApplicationController
  def index
    @data = Customer.joins(:customer_type)
    render json:{data:@data , success:true}
  end
end
