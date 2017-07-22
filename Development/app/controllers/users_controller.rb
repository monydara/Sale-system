
class UsersController < ApplicationController

    def index
        @data = User.where is_admin:false
        # User.all = select * from user
        # User.find(1 ) = select * from user where id=1
        render json:{ data:@data , success:true}
    end

    def create

        begin
            User.transaction do
                @data = User.new(permit_data)
                @data.is_admin = false
                @data.password = params[:password]

                if @data.valid?
                    @data.save
                    render json:{ data:@data ,success:true}
                else
                    render json:{ message:data.errors.full_messages.first, success:false}
                end

            end

        rescue Exception => e

            render json:{ message:e.message ,success:false}
        end


    end

    def update
        @data = User.find(params[:id])

        @data.update_attributes(permit_data)

        render json:{ data:@data ,success:true}

    end
    def destroy

    end

    private
    def permit_data
        params.permit(
            :id,
            :code,
            :date_join,
            :first_name,
            :last_name,
            :phone,
            :email,
            :role_id,
            :department_id,
            :username,
            :address,
            :is_active,
            :is_admin
        )
    end


end

