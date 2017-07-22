class LoginController < ApplicationController
	
	def login
		session[:user_id] = 1
		session[:location_id] =1
		render json:{ message:'log in success' , success:true}
		
	end
end
