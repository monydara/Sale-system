class ReportCustomersController < ApplicationController
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
  @model = Customer.joins(:customer_type,:custom_price, :contact, :area )
    # ----- parameter
    p = permit_data()


    # --- filter
    if @validate.isNotBlank p[:customer_name]
      @model=  @model.where "customers.name like '%#{p[:customer_name]}%'"
    end
    if @validate.isNotBlank p[:mobile]
      @model=  @model.where "customers.mobile like '%#{p[:mobile]}%'"
    end
    if @validate.isNotBlank p[:phone]
      @model=  @model.where "customers.phone like '%#{p[:phone]}%'"
    end
    if @validate.isNotBlank p[:email]
      @model=  @model.where "customers.email like '%#{p[:email]}%'"
    end
    if @validate.isNotBlank p[:contact_name]
      @model=  @model.where "contacts.contact_name like '%#{p[:contact_name]}%'"
    end
    if @validate.isNotBlank p[:customer_type_id]
      @model=  @model.where "customers.customer_type_id = #{p[:customer_type_id]}"
    end
    if @validate.isNotBlank p[:custom_price_id]
      @model=  @model.where "customers.custom_price_id = #{p[:custom_price_id]}"
    end

    if @validate.isNotBlank p[:customer_area_id]
     @model=  @model.where "customers.customer_area_id = #{p[:customer_area_id]}"
    end

    @data = @model.select("customers.* ,
      customer_types.name customer_type_name ,
      custom_prices.name custom_price_name,
      areas.name area_name,
      contacts.contact_name
      ")
end
  def permit_data
		params.permit(
      :customer_name,
      :mobile,
      :phone,
      :email,
      :contact_name,
      :customer_type_id,
      :custom_price_id,
      :customer_area_id,
      :column
	    )
	end
end
