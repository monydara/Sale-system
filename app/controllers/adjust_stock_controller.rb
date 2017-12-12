class AdjustStockController < ApplicationController
	@@common = Common.new
	def index
		data = AdjustStock.joins(:locations)
		if !params[:search_string].nil?
			text = "%" + params[:search_string] + "%"
			data = data.where("adjust_stocks.ref_no like '#{text}'
				")
		end
		result= data.select("adjust_stocks.*, locations.name location_name")
		render @@common.returnJoinPaginate(data,result, params[:page], params[:limit])
	end
	def create
		data = AdjustStock.new(permit_data)
		if EomController.check_eom_date(data.date) == false
			session[:success] = false 
			session[:message] = "<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only "
		else
			data.created_by = @current_user.id
			data.save
			if data.valid?
				render json: {data:data, success:true}
			else
				render json: {data:data , success:false, error:data.errors}
			end
		end
	end
	def update
		data = AdjustStock.find(params[:id])
		data.modify_by = @current_user.id
		data.update_attributes(permit_data_edit)

		if data.valid?
			render json: {data:data, success:true}
		else
			render json: {data:data , success:false, error:data.errors}
		end
	end

	def get_item_detail
		data = []
		if !params[:adjust_stock_id].nil?
			data = AdjustStockDetail.joins(:ums ,:items, :adjust_stock_type).where(adjust_stock_id:params[:adjust_stock_id]).select("
				adjust_stock_details.* ,ums.name um , items.name item_name, adjust_stock_types.name adjust_type_name")
		end
		render json:{ data:data , success:true }
	end

	private
	def permit_data
		params.permit(
			:date,
			:auto_code,
			:ref_no,
			:location_id,
			:remark,
			# :created_by,
			# :modify_by,
			:adjust_stock_detail_attributes => [
				:adjust_stock_id,
				:item_id,
				:serial_no,
				:qty,
				:um_id,
				:multiplier,
				:total_qty,
				:cost,
				:adjust_type_id,
				# :created_by,
				# :modify_by,
			]
		)
	end
	def permit_data_edit
		params.permit(
			:id,
			:date,
			# :auto_code,
			:ref_no,
			:location_id,
			:remark,
			# :created_by,
			# :modify_by,
			:adjust_stock_detail_attributes => [
				:id,
				:adjust_stock_id,
				:item_id,
				:serial_no,
				:qty,
				:um_id,
				:multiplier,
				:total_qty,
				:cost,
				:adjust_type_id,
				# :created_by,
				# :modify_by,
			]
		)
	end
end
