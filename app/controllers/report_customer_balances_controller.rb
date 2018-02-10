class ReportCustomerBalancesController < ApplicationController
  def initialize
      @validate = Util::Validate.new
  end
  def index
    @data = get_data
    render json:{data:@data , success:true}
  end
  private
  def get_data
    @data = CustomerTransaction.joins(:customer )
    .select(' customers.name customer_name  ,  customer_transactions.currency_id, sum(customer_transactions.amount) as balance')
    .order('customers.id ')
    .group("customers.id , customer_transactions.currency_id")
    p= permit_data

    if @validate.isNotBlank p[:customer_id]
      @data=  @data.where "customer_transactions.customer_id = #{p[:customer_id]}"
    end

    if @validate.isNotBlank p[:currency_id]
       @data=  @data.where "customer_transactions.currency_id = #{p[:currency_id]}"
    end
    @data
  end
  def permit_data
    params.permit(
      :customer_id,
      :currency_id,
      :column
    )
  end
end
