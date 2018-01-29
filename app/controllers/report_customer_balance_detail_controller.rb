class ReportCustomerBalanceDetailController < ApplicationController
  def index

    @data = get_data

    render json:{data:@data , success:true}
  end

private
def get_data
  @validate = Util::Validate.new
  @data = CustomerTransaction.joins(:customer , :transaction_type)
  .select('customer_transactions.* , customers.name customer_name , transaction_types.name transaction_type_name')
  .where 'customer_transactions.transaction_type_id in (2,6)'

  p= permit_data

  if @validate.isNotBlank p[:customer_id]
    @data=  @data.where "customer_transactions.customer_id = #{p[:customer_id]}"
  end

  if @validate.isNotBlank p[:ref_no]
    @data=  @data.where "customer_transactions.ref_no like  '%#{p[:ref_no]}%'"
  end

  if @validate.isNotBlank p[:from_date]
    @data=  @data.where "customer_transactions.date between  '#{p[:from_date]}' and '#{p[:to_date]}'"
  end
  @data
end
  def permit_data
    params.permit(
      :customer_id,
      :ref_no,
      :from_date,
      :to_date,

      :column
    )
  end
end
