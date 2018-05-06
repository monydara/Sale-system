class CustomPricesController < ApplicationController
  @@common = Common.new
  def index

     @data = CustomPrice
     render @@common.returnPaginate(@data, params[:page],params[:limit])
  end

  def get_item_detail
      @data = CustomPriceDetail.joins(:ums, item_sku:[items:[:currency]]).where(custom_price_id:params[:custom_price_id]).select("custom_price_details.* ,
         ums.name 'um_name' , item_skus.code 'item_name' , currencies.symbol")
      render json:{ data:@data , success:true}

  end

  def combo

     @data =CustomPrice.where is_active:true
     if !params[:query].nil?
       @data = @data.where("name like '%#{params[:query]}%'")
     end

     render json:{ data:@data , success:true}

  end
  def create
     begin
        user_id = @current_user.id
        @data = CustomPrice.new(permit_data)

        if @data.valid?
           @data.created_by=user_id
           @data.save
           render json:{ success:true , message:'LeadOpportunity save success.'}
        else
           render json:{ success:false , message:@data.errors.full_messages.first}
        end
     rescue Exception => e
        puts e.backtrace
        render json:{success:false, message:e.message }
     end

  end
  def update

        user_id =  @current_user.id
        @data = CustomPrice.find params[:id]
        @data.update_attributes(permit_data)
        @data.update(updated_by:user_id)
        if @data.valid?
          render json:{ success:true , message:"Update LeadOpportunity Success "}
        else
          render json:{error:@data.errors, success:false}
        end


  end

  def destroy

  end

  private
  def permit_data
     params.permit(
        :name,
        :is_active,
        :description,
        custom_price_detail_attributes:[
           :id,
           :item_id,
           :um_id,
           :price,
           :extend_price,
           :_destroy
        ]

        )
  end
end
