class RoleController < ApplicationController
    def index
        @data = Role.all

        render json:{ data:@data , success:true}
    end

    def combo
        @data = Role.where is_active:true
        render json:{ data:@data , success:true }
    end

    def create

        begin
            Role.transaction do
                @data = Role.new(permit_data)
                @data.save

                render json:{ data:@data ,success:true}
            end

        rescue Exception => e

            render json:{ message:e.message ,success:false}
        end


    end

    def update
        @data = Role.find(params[:id])

        @data.update_attributes(permit_data)

        render json:{ data:@data ,success:true}

    end
    def destroy

    end

    def get_menu_list
        begin
            service = Roles::Service.new()
            role_id = params[:role_id]
            puts"=========================role_id=#{role_id}"
            data = service.get_menu role_id
            render json:{ success:true , data:data}
        rescue Exception => e
            puts e.message
            render json:{ success:false , message:e.message}
        end
    end

    private
    def permit_data
        params.permit(
            :id,
            :name,
            :description,
            :is_active,
            :is_admin,
            rel_menu_role_attributes:[
                :id ,
                :menu_id ,
                :_destroy
            ]
        )
    end
end
