class SysMenuController < ApplicationController
  @@common = Common.new
	def index
		data = SysMenu.order(:seq_no)
		if !params[:string].nil?
			text = "%"+params[:string]+"%"
			data = data.where(" menu like '%#{text}%'")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def combo
		data = SysMenu.where is_leaf:0
    render json:{ data:data , success:true}
	end

	def create
		data = SysMenu.new(permit_data)
		data.save
		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ error:data.errors, success:false}
		end

	end

	def update
		data = SysMenu.find(params[:id])
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def destroy

	end

	private
	def permit_data
		params.permit(

        :menu,
        :icon_cls,
        :expand,
        :is_leaf,
        :parent_id,
        :action,
        :is_active,
        :view_index,
        :controller_name,
				:seq_no
			)

	end
end
