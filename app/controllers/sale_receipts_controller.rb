class SaleReceiptsController < ApplicationController

  @@common = Common.new
  def index
    model = Invoice.joins( :customer ).where is_sale_receipt:true
    data = model.select( " invoices.* ,
		 customers.name customer_name ,
		 invoices.grand_total_amount grand_total_amount_display ,
		 invoices.total_amount total_amount_display
		 ")


    if !params[:search_string].nil?
      text = "%"+params[:search_string] + "%"
      data =data.where("invoices.invoice_no like  '#{text}' or customers.name like '#{text}'  ")
    end

    render  @@common.returnJoinPaginate(  model, data, params[:page],params[:limit])
  end

  def create

    saleInvController = SaleInvoiceController.new
    data = Invoice.new(permit_data_invoice)
    result = saleInvController.create_service true , params, data , 1 , @current_user.id

    render json:result
  end

  def update

  end

  def destroy

  end

  def permit_data_invoice
    params.permit(
        :invoice_no,
        :sale_quotation_id,
        :location_id,
        :customer_id,
        :date,
        :due_date,
        :ref_no,
        :total_amount,
        :discount_percentag,
        :discount_amount,
        :tax_percentag,
        :tax_amount,
        :grand_total_amount,
        :memo,
        :invoice_detail_attributes=> [
            :invoice_id,
            :item_id,
            :description,
            :serial,
            :qty,
            :um_id,
            :multiplier,
            :currency_id ,
            :total_qty,
            :dis_amount,
            :dis_percentage,
            :price,
            :extent_price
        ]
    )
  end
end
