class ReportCustomerBalanceDetailController < ApplicationController
  def initialize
    @servie  = Reports::CustomerBalance.new
    @validate = Util::Validate.new
    @common = Common.new
  end
  def index
    get_data
    render @common.returnJoinPaginate(  @model, @data, params[:page],params[:limit])
  end
  def print
    #code
  end

private
def get_data

  @model = CustomerTransaction.joins(:customer , :transaction_type)
  .where('customer_transactions.transaction_type_id in (2,6)')
  .order('customers.id , customer_transactions.date')

  p= permit_data

  if @validate.isNotBlank p[:customer_id]
    @model=  @model.where "customer_transactions.customer_id = #{p[:customer_id]}"
  end

  if @validate.isNotBlank p[:ref_no]
    @model=  @model.where "customer_transactions.ref_no like  '%#{p[:ref_no]}%'"
  end

  # if @validate.isNotBlank p[:from_date]
  #   @model=  @model.where "customer_transactions.date between  '#{p[:from_date]}' and '#{p[:to_date]}'"
  # end

  if @validate.isNotBlank p[:currency_id]
     @model=  @model.where "customer_transactions.currency_id = #{p[:currency_id]}"
  end
  @model  = @servie.calculate_balance @model

  @data = @model.select('customer_transactions.* , customers.name customer_name , transaction_types.name transaction_type_name , 0 as balance')

end

  def permit_data
    params.permit(
      :customer_id,
      :ref_no,
      :currency_id,


      :column
    )
  end
end
