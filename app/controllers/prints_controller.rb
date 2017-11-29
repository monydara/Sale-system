class PrintsController <  ActionController::Base

  def print_invoice
    if !params[:id].nil?

      @invoice = Invoice.find(params[:id])
      @company  = CompanyProfile.find(1)
      @customer = @invoice.customer
      @invoice_detail = @invoice.invoice_detail.order("currency_id")
      @default_currency = Currency.find_by_is_base true
      @invoice_by_currency =@invoice_detail.select(" currency_id , sum(extent_price) amount ").group("currency_id")
      @quotation_no = ''

      quotation = @invoice.sale_quotation
      if !quotation.nil?
        @quotation_no = quotation.sale_quotation_no
      end

      @additional_row = ""

      # ====== add discount item
      if @invoice.discount_amount > 0
        @additional_row = "
					<tr class='none-border-bottom'>
						<td>
							Discount
						</td>
						<td></td>
						<td></td>
						<td>
							<div class='left'>
										$
							</div>
							<div class='right'>
								(#{ '%.02f' %  @invoice.discount_amount  })
							</div>
						</td>

					</tr>
				"

      end


    end

    invoice_file_name = SysConfig.get_config_by_code "INV01"
    puts "----- #{invoice_file_name} ======"
    render invoice_file_name

    #
    # # ========= testing ======
    #
    # render_to_string(:layout => @invoice_file_name, :layout => false)
    #
    # #render html: @htmldoc
    #
    #
    # #render json: { data: render_to_string('print_invoice_lux.html.erb') }
  end

  def print_reciept
    @rpt = ReceivePayment.find params[:id]
    @company  = CompanyProfile.find(1)
    @customer = @rpt.customer
    @rpt_by_currency =@rpt.receive_payment_detail.select(" currency_id , sum(amount) amount ").group("currency_id")
    receipt_file_name = SysConfig.get_config_by_code "RPT01"
    puts "----- #{receipt_file_name} ======"
    render receipt_file_name
  end

end
