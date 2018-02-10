class ReportCustomerBalanceDetailController < ApplicationController
  def initialize
    @servie  = Reports::CustomerBalance.new
    @validate = Util::Validate.new
  end
  def index

    @data = get_data

    render json:{data:@data , success:true}
  end
  def print
    #code
  end

private
def get_data

  @data = CustomerTransaction.joins(:customer , :transaction_type)
  .select('customer_transactions.* , customers.name customer_name , transaction_types.name transaction_type_name , 0 as balance')
  .where('customer_transactions.transaction_type_id in (2,6)')
  .order('customers.id , customer_transactions.date')

  p= permit_data

  if @validate.isNotBlank p[:customer_id]
    @data=  @data.where "customer_transactions.customer_id = #{p[:customer_id]}"
  end

  if @validate.isNotBlank p[:ref_no]
    @data=  @data.where "customer_transactions.ref_no like  '%#{p[:ref_no]}%'"
  end

  # if @validate.isNotBlank p[:from_date]
  #   @data=  @data.where "customer_transactions.date between  '#{p[:from_date]}' and '#{p[:to_date]}'"
  # end

  if @validate.isNotBlank p[:currency_id]
     @data=  @data.where "customer_transactions.currency_id = #{p[:currency_id]}"
  end
  @data  = @servie.calculate_balance @data

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
