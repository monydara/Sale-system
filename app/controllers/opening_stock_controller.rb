class OpeningStockController < ApplicationController
	@@common = Common.new
	def index
		data = OpeningStock.joins(:locations).select("opening_stocks.*, locations.name location_name")

		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("opening_stocks.ref_no like  '#{text}' or locations.name like '#{text}' ")
		end
		render  @@common.returnPaginate(  data, params[:page],params[:limit])
	end
	def create
		data = OpeningStock.new(permit_data)

		if EomController.check_eom_date(data.date) == false
			session[:success] = false 
			session[:message] = "<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only "
		else
			data.created_by = @current_user.id
			data.save
			if data.valid?
				render json:{ data:data , success:true }
			else
				render json:{ data:data , success:false, error:data.errors}
			end
		end
	end
	def update
		data = OpeningStock.find(params[:id])
		data.modify_by = @current_user.id
		data.update_attributes(permit_data_edit)

		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ data:data , success:false, error:data.errors }
		end
	end
	def get_item_detail
		data = []
		if !params[:opening_stock_id].nil?
			data = OpeningStockDetail.joins(:ums ,:items).where(opening_stock_id:params[:opening_stock_id]).select("
				opening_stock_details.* ,ums.name um , items.name item_name , items.barcode , items.code  ")
		end

		render json:{ data:data , success:true }
	end

	private
	def permit_data
		params.permit(
			:location_id,
		    :date,
		    :ref_no,
		    :remark,
		    :opening_stock_detail_attributes => [
		    	:opening_stock_id,
		    	:item_id,
		    	:serial_no,
		    	:qty,
		    	:um_id,
		    	:multiplier,
		    	:total_qty,
		    	:cost		    ]
	    )
	end
	def permit_data_edit
		params.permit(
			:id,
			:location_id,
		    :date,
		    :ref_no,
		    :remark,
		    :opening_stock_detail_attributes => [
		    	:id,
		    	:opening_stock_id,
		    	:item_id,
		    	:serial_no,
		    	:qty,
		    	:um_id,
		    	:multiplier,
		    	:total_qty,
		    	:cost		    ]
	    )
	end
end
