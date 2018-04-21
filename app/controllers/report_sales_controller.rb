class ReportSalesController < ApplicationController
  def index
    data = get_data
    render json:{data:data , success:true}
  end

  def print
    @data = get_data
  end
  def get_data
  #code
  @validate = Util::Validate.new
  # --- query table
  @data = Invoice.joins(:customer).select("invoices.* , customers.name")


    # ----- parameter
    p = permit_data()


    # --- filter
    if @validate.isNotBlank p[:from_date]
      if @validate.isNotBlank p[:end_date]
        @data=  @data.where " invoices.created_at between '#{p[:from_date]}' and  '#{p[:end_date]}' "
      else
          @data=  @data.where " invoices.created_at between '#{p[:from_date]}' and current_timestamp() "
      end

    end
    if @validate.isNotBlank p[:customer_id]
      @data=  @data.where "customers.id =#{p[:customer_id]}"
    end

    @data
end
  def permit_data
		params.permit(
      :customer_id,
      :from_date,
      :end_date,
      :column
	    )
	end
end
