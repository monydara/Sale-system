class ReportCustomersController < ApplicationController

  def index
    @data = get_data
    render json:{data:@data , success:true}
  end

  def print
    @data = get_data
  end
def get_data
  #code
  @validate = Util::Validate.new
  # --- query table
  @data = Customer.joins(:customer_type,:custom_price, :contact, :area )
  @data = @data.select("customers.* ,
    customer_types.name customer_type_name ,
    custom_prices.name custom_price_name,
    areas.name area_name,
    contacts.contact_name
    ")

    # ----- parameter
    p = permit_data()


    # --- filter
    if @validate.isNotBlank p[:customer_name]
      @data=  @data.where "customers.name like '%#{p[:customer_name]}%'"
    end
    if @validate.isNotBlank p[:mobile]
      @data=  @data.where "customers.mobile like '%#{p[:mobile]}%'"
    end
    if @validate.isNotBlank p[:phone]
      @data=  @data.where "customers.phone like '%#{p[:phone]}%'"
    end
    if @validate.isNotBlank p[:email]
      @da
      ta=  @data.where "customers.email like '%#{p[:email]}%'"
    end
    if @validate.isNotBlank p[:contact_name]
      @data=  @data.where "contacts.contact_name like '%#{p[:contact_name]}%'"
    end
    if @validate.isNotBlank p[:customer_type_id]
      @data=  @data.where "customers.customer_type_id = #{p[:customer_type_id]}"
    end
    if @validate.isNotBlank p[:custom_price_id]
      @data=  @data.where "customers.custom_price_id = #{p[:custom_price_id]}"
    end

    if @validate.isNotBlank p[:customer_area_id]
     @data=  @data.where "customers.customer_area_id = #{p[:customer_area_id]}"
    end
    @data
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
