class ReportCustomerBalancesController < ApplicationController
  def initialize
      @common = Common.new
      @validate = Util::Validate.new
  end
  def index
    @data = get_data
    render @common.returnJoinPaginate(  @model, @data, params[:page],params[:limit])
  end
  private
  def get_data
    @model = CustomerTransaction.joins(:customer )
    .order('customers.id ')
    .group("customers.id , customer_transactions.currency_id")
    p= permit_data

    if @validate.isNotBlank p[:customer_id]
      @model=  @model.where "customer_transactions.customer_id = #{p[:customer_id]}"
    end

    if @validate.isNotBlank p[:currency_id]
       @model=  @model.where "customer_transactions.currency_id = #{p[:currency_id]}"
    end
    @data = @model.select(' customers.name customer_name  ,  customer_transactions.currency_id, sum(customer_transactions.amount) as balance')
  end
  def permit_data
    params.permit(
      :customer_id,
      :currency_id,
      :column
    )
  end
end
