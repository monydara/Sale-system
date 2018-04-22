class ReportSaleItemsController < ApplicationController
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
  @data = InvoiceDetail.joins(:invoice, :currency , item_sku:[:items]).select("invoice_details.* , invoices.invoice_no,currencies.symbol , items.name item_name , item_skus.code item_code")


    # ----- parameter
    p = permit_data()


    # --- filter

    if @validate.isNotBlank p[:invoice_id]
      @data=  @data.where "invoice_id =#{p[:invoice_id]}"
    end

    if @validate.isNotBlank p[:item_id]
      @data=  @data.where "invoice_details.item_id =#{p[:item_id]}"
    end

    @data
  end
  def permit_data
    params.permit(
      :invoice_id,
      :item_id,
      :column
      )
  end
end
