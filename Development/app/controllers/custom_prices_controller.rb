class CustomPricesController < ApplicationController
  @@common = Common.new
  def index

     @data = CustomPrice
     render @@common.returnPaginate(@data, params[:page],params[:limit])
  end

  def get_item_detail
      @data = CustomPriceDetail.where custom_price_id:params[:custom_price_id]
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
        user_id =  session[:user_id]
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
     begin
        user_id =  session[:user_id]
        @data = CustomPrice.find params[:id]
        @data.update_attributes(permit_data)
        @data.update(updated_by:user_id)
        render json:{ success:true , message:"Update LeadOpportunity Success "}
     rescue Exception => e
        render json:{ success:false  , message:e.message}
     end
  end

  def destroy

  end

  private
  def permit_data
     params.permit(
        :id,
        :name,
        :is_active,
        :description,
        custom_price_detail_attributes:[
           :id,
           :item_id,
           :um_id,
           :price
        ]

        )
  end
end
