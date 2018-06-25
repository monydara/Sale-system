class ReportSalesController < ApplicationController
  def initialize
    @common = Common.new
    @validate = Util::Validate.new
  end
  def index
     get_data
    render @common.returnJoinPaginate(  @model, @data, params[:page],params[:limit])
  end

  def print
    @data = get_data
  end
  def get_data

  # --- query table
  @model = Invoice.joins(:customer)


    # ----- parameter
    p = permit_data()


    # --- filter
    if @validate.isNotBlank p[:from_date]
      if @validate.isNotBlank p[:end_date]
        @model=  @model.where " invoices.created_at between '#{p[:from_date]}' and  '#{p[:end_date]}' "
      else
          @model=  @model.where " invoices.created_at between '#{p[:from_date]}' and current_timestamp() "
      end

    end
    if @validate.isNotBlank p[:customer_id]
      @model=  @model.where "customers.id =#{p[:customer_id]}"
    end

    @data =@model.select("invoices.* , customers.name")
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
