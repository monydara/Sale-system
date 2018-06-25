class LoginController < ApplicationController
	skip_before_action :authenticate, :only => [:login]
	@@check_license = false
	def login

		# check license

		# is_license =Y5netLicense.check_license
		# puts "licen acative == #{is_license}"

		@username = params[:username]
		@password = params[:password]

		# if  is_license != true

		#     if !@username.nil?
		#         puts "_________ ativate licenst"
		#         @message = Y5netLicense.activate_license @username
		#         if @message == "Key activated"
		#            @@check_license =true
		#         end
		#     else
		#         puts "_________ ativate licenst"
		#         @message = is_license
		#     end

		#     render  '/home/login'
		# elsif

		if !@username.nil? && !@password.nil?

			@user = User.find_by username:@username

			if @user.nil?


				render json:{ login:false , success:false , message:"Incorrect User name "}
			elsif @user.encrypted_password ==@password

				if @user.is_active == false

					render json:{ login:false , success:false , message:"Your account is deactive in system"}
				else

					session[:user_id] = @user.id
					puts "user iD  : #{@user.id } , session : #{ session[:user_id] }"
					session[:user] = @user
					@user.api_key = @user.generate_api_key
					@user.save
					render json:{ message:'log in success' , success:true , token: @user.api_key}
				end

			else

				render json:{ login:false , success:false , message: "Incorrect Password"}
			end
		end

		# @message = "Testing"

	end

	def logout
		reset_session
		render json:{  success:true , message: "Log out success"}
	end
	# def login
	# 	session[:user_id] = 1
	# 	session[:location_id] =1
	# 	render json:{ message:'log in success' , success:true}
	#
	# end
end
