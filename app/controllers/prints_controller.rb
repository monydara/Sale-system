class PrintsController <  ActionController::Base

  def print_invoice
  
    if !params[:id].nil?

      @invoice = Invoice.find(params[:id])
      @company  = CompanyProfile.first
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

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "invoice.pdf",:template => "./prints/#{invoice_file_name}.html.erb"
        # render pdf: invoice_file_name+".html.erb"   # Excluding ".pdf" extension.
      end
    end
    # render invoice_file_name

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
  def print_test
  
      puts "---- print test"
      respond_to do |format|
        format.html
        format.pdf do
          render :pdf => "invoice.pdf" ,:template =>"./prints/print_test.html.erb"
          # render pdf: invoice_file_name+".html.erb"   # Excluding ".pdf" extension.
        end
      end
  end 
  def print_reciept
    @rpt = ReceivePayment.find params[:id]
    @company  = CompanyProfile.first
    @customer = @rpt.customer
    @rpt_by_currency =@rpt.receive_payment_detail.select(" currency_id , sum(amount) amount ").group("currency_id")
    receipt_file_name = SysConfig.get_config_by_code "RPT01"
    puts "----- #{receipt_file_name} ======"
    render receipt_file_name
  end
  def print_quotation

    if !params[:id].nil?

      @quotation = SaleQuotation.find(params[:id])
      @company  =  CompanyProfile.first
      @customer = @quotation.customer
      @sale = @quotation.sale_representative
      @quotation_detail = @quotation.sale_quotation_detail
      render 'prints/print_quotation'
    end
  end
end
