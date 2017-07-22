class ItemsController < ApplicationController
	@@common = Common.new
	@@image_url = ''

	def index
		data = Items.joins(:item_category, :item_type, :ums).select("items.* , item_categories.name 'category_name',
			item_types.name 'item_type_name', ums.name 'um_name'" )
		if !params[:search_string].nil?
			text = '%' + params[:search_string] + '%'
			data = data.where("items.name like '#{text}' or items.code like '#{text}' or items.barcode like '#{text}'")
		end
		render @@common.returnJoinPaginate(Items ,data, params[:page],params[:limit])
	end

   def get_detail
      item_id = params[:item_id]
      data = []
      if !item_id.nil?
         data = ItemPrice.where item_id:item_id
      end
      render json:{ data:data , success:true }
   end

	def comboFixedAsset
		data = Items.joins(:item_category , :ums ).select("items.* , item_categories.name 'category_name' , ums.name 'um'" )
		data = data.where("items.item_type_id='3'")## Filter only item fixed asset (3=Fixed Asset)
		render json:{data:data , success:true}
	end
	def combo

		data = Items.joins(:item_category , :ums ).select("items.* , item_categories.name 'category_name' , ums.name 'um'" )
		text = params[:query]
		if !text.nil?
			data = data.where "items.name like '%#{text}%' "
		end
		render json:{data:data , success:true}
	end

	def create
		Items.transaction do
			data = Items.new(permit_data)
			# generate code
			data.code = @@common.get_code_with_config("ITEM" , params[:code])
			data.create_by = session[:user_id]
			data.cost_avc = 0
			# insert um Price
			@itemPrice = [{um_id:data.um_id.to_i,price:data.price,multiplier:1.to_i }]
			puts data
			data.item_price_attributes =@itemPrice
			if data.valid?
				data.save
				@@image_url = ''
				render json:{data:data, success:true}
			else
				render json:{ message:data.errors.full_messages.first, success:false}
				raise ActiveRecord::Rollback
			end
		end

	end

	def update

		data = Items.find(params[:id])
		data.modify_by = session[:user_id]
		old_code = data.code
		data.update_attributes(permit_data)

		if data.valid?
			data.save()
			render json:{data:data, success:true}
		else
			render json:{ message:data.errors.full_messages.first, success:false}

		end
	end

	def remove_image
		data = Items.find(params[:id])
		data.update_attributes(image_url:nil)
		render json:{data:data, success: true}
	end

	def destroy

	end

	def upload_image
		begin
			data =Image.new(permit_data_image)
			data.save
			@@image_url = data.image.url
			render json:{ image_url:@@image_url , success:true}
		rescue Exception => e
			puts e
			render json:{ errors:data.errors , success:false , messge:'Image upload unsuccess'}

		end
	end

	private
	def check_code_exist(code)
		result = false
		item = Items.find_by code:code
		if !item.nil?
			result = true
		end
		return result
	end

	def permit_data_image
		params.permit(
			:image
			)
	end

	def permit_data
		params.permit(
			:name,
			:code,
			:barcode,
			:item_type_id ,
			:category_id,
			:um_id,
			:price,
			:re_order_point,
			:is_use_serial,
			:image_url,
			:series_id,
			:model_id,
			:color,
			:depreciation_method_id,
			:depreciation_type_id,
			:depreciation_rate,
			:purchase_description,
			:sale_description,
			:memo,
			:status,
         item_price_attributes:[
            :id ,
            :um_id ,
            :multiplier,
            :price ,
            :remark
         ]
		)
	end
end
