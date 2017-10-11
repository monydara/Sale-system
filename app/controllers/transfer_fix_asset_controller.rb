
class TransferFixAssetController < ApplicationController
	@@common = Common.new
	def index
		
		query = "select t.* , fl.name as from_location , tl.name as to_location from transfer_stocks  t 
				inner join locations fl on fl.id = t.from_location_id 
				inner join locations tl on tl.id = t.to_location_id"

		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			query = query + " where transfer_stocks.ref_no like  '#{text}' or locations.name like '#{text}'  or transfer_stocks.remark like '#{text}' "
		end

		query = query + " limit #{params[:limit]} offset #{(params[:page].to_i-1)}"
		data = TransferStock.find_by_sql(query)
		render  @@common.returnJoinPaginate( TransferStock, data, params[:page],params[:limit])
	end

	def combo
		data = TransferStock.joins(:item_category , :ums ).select("items.* , item_categories.name 'category_name' , ums.name 'um'" )
		render json:{data:data , success:true}
	end

	def get_item_detail
		data = []
		if !params[:transfer_stock_id].nil?
			data = TransferStockDetail.joins(:ums ,:items).where( transfer_stock_id:params[:transfer_stock_id]).select("
				transfer_stock_details.* ,ums.name um , items.name item_name , items.barcode")
			
		end

		render json:{ data:data , success:true }
	end

	def create
		TransferStock. transaction do
			data =[]
				data = TransferStock.new(permit_data)
				data.save
				if TransferFixAssetHelper.CheckSotckAvaible(data,data.from_location_id)==false
					render json:{data:data, success:false, message:'This location not avaliable to transfer.'}
					raise ActiveRecord::Rollback
				else


					if data.valid?
						success = TransferFixAssetHelper.save_to_stock_transaction_to_location(data, session[:user_id] , data.to_location_id, data.from_location_id, session[:ref_no], session[:success], session[:message])
						render json:{data:data , success:success}
					else
						render json:{data:data, success:false}
					end
				
			end
		end
	end

	def update
		TransferStock. transaction do
			id = params[:id]
			data = TransferStock.find(id)
			TransferFixAssetHelper.remove_item_transaction(data)
			data.update_attributes(permit_data_edit)
			if TransferFixAssetHelper.CheckSotckAvaible(data, data.from_location_id)==false
				render json:{data:data, success:false, message:'This location not avaliable to transfer. Because item in stock eqaul 0.'}
				raise ActiveRecord::Rollback
			else
				session[:success]= TransferFixAssetHelper.save_to_stock_transaction_to_location(data, session[:user_id] , data.to_location_id, data.from_location_id, session[:ref_no], session[:success], session[:message])
				if data.valid?
					render json:{data:data, success:true}
				else
					render json:{error:data.errors, success:false}
				end		
			end	
		end
				
	end

	def destroy
		
	end

	private
	def permit_data

		params.permit(
			:auto_code,
		    :date,
		    :ref_no,
		    :from_location_id,
		    :to_location_id,
		    :remark,
		    :transfer_stock_detail_attributes => [
		    	:transfer_stock_id	,
		    	:item_id,
		    	:qty,
		    	:um_id,
		    	:total_qty,
		    	:serial_no
		    		   
		    ]
		)
	end

	def permit_data_edit
		params.permit(
			:id,
			:auto_code,
		    :date,
		    :ref_no,
		    :from_location_id,
		    :to_location_id,
		    :remark,
		    :transfer_stock_detail_attributes => [
		    	:id,
		    	:transfer_stock_id	,
		    	:item_id,
		    	:qty,
		    	:um_id,
		    	:total_qty,
		    	:serial_no  , 
		    	:_destroy 
		    ])
	end



end

