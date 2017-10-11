class TerminateMaintenanceController < ApplicationController
	@@common = Common.new
	def index
		data = Maintenance.joins(:customer).select("maintenances.*, customers.name customer_name,
			maintenances.amount amount_display")

		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("maintenances.maintenance_no like  '#{text}' or customers.name like '#{text}' ")
		end
		render  @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def update
		data = Maintenance.find(params[:id])
		data.modify_by = session[:user_id]
		data.update_attributes(permit_data_edit)

		if data.valid?
			render json:{ data:data , success:true }
		else
			render json:{ data:data , success:false, error:data.errors}
		end
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
