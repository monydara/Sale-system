class MaintenanceController < ApplicationController
	@@common = Common.new
	def index
		data = Maintenance.joins(:customer).select("maintenances.*, customers.name customer_name,
			maintenances.amount amount_display").where("maintenances.status = 1")

		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("maintenances.maintenance_no like  '#{text}' or customers.name like '#{text}' ")
		end
		render  @@common.returnPaginate(  data, params[:page],params[:limit])
	end

	def create
		data = Maintenance.new(permit_data)
		data.created_by = @current_user.id
		data.status = 1
		data.save
		if data.valid?
			render json:{ data:data , success:true }
		else
			render json:{ data:data , success:false, error:data.errors}
		end
	end

	def update
		data = Maintenance.find(params[:id])
		data.modify_by = @current_user.id
		data.update_attributes(permit_data_edit)

		if data.valid?
			render json:{ data:data , success:true }
		else
			render json:{ data:data , success:false, error:data.errors}
		end
	end

	def get_item_detail
		data = []
		if !params[:maintenance_id].nil?
			data = MaintenanceDetail.joins(:ums ,:items).where(maintenance_id:params[:maintenance_id]).select("
				maintenance_details.* ,ums.name um , items.name item_name  ")
		end

		render json:{ data:data , success:true }
	end

	private
	def permit_data
		params.permit(
			:maintenance_no,
			:invoice_id,
			:customer_id,
			:amount,
			:status,
			:start_date,
			:end_date,
			:remark,
			:maintenance_detail_attributes =>[
		        :maintenance_id,
		        :item_id,
		        :description,
		        :serial_no,
		        :qty,
		        :multiplier,
		        :um_id ,
		        :total_qty,
		        :is_free,
		        :price,
		        :extend_price,
			]
		)
	end

	def permit_data_edit
		params.permit(
			:id,
			:maintenance_no,
			:invoice_id,
			:customer_id,
			:amount,
			:status,
			:start_date,
			:end_date,
			:remark,
			:maintenance_detail_attributes =>[
				:id,
		        :maintenance_id,
		        :item_id,
		        :description,
		        :serial_no,
		        :qty,
		        :multiplier,
		        :um_id ,
		        :total_qty,
		        :is_free,
		        :price,
		        :extend_price, ]
			)
		
	end
end
