class ReportSaleItemsController < ApplicationController
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
  @model = InvoiceDetail.joins(:invoice, :currency , item_sku:[:items])


    # ----- parameter
    p = permit_data()


    # --- filter

    if @validate.isNotBlank p[:invoice_id]
      @model=  @model.where "invoice_id =#{p[:invoice_id]}"
    end

    if @validate.isNotBlank p[:item_id]
      @model=  @model.where "invoice_details.item_id =#{p[:item_id]}"
    end

    @data=@model.select("invoice_details.* , invoices.invoice_no,currencies.symbol , items.name item_name , item_skus.code item_code")
  end
  def permit_data
    params.permit(
      :invoice_id,
      :item_id,
      :column
      )
  end
end
