class EomController < ApplicationController

	def create
		@data =Eom.new
		@data.password = "123456"
		@data.date = "2015-06-14"
		@data.status = "Open" 
		@data.memo = "this is for close testing"


		# get last record 
		@last_date = Eom.order("created_at").last
		if !@last_date.nil?
			
			@data.last_close_date = @last_date.date
		
		end

		@data.save
		render json:{ data:@data , success:true}
	end

	def index
			@last_date = Eom.order("created_at").last
			render json:{ date:@last_date.date , close_date:@last_date.last_close_date , status:@last_date.status }
	end
	# def check
	# 	if check_date("2015-05-14") == true
	# 		render json:{ result:true }	
	# 	else
	# 		render json:{ result:false}
	# 	end
	# end

	def self.check_eom_date( date )
	
		begin
				
			# date format (Y-m-d)
			condition_date = Date.strptime(date.to_s, "%Y-%m-%d")

			@data = Eom.order("created_at").last

			if !@data.nil? 
				# check status before put date for compare
				if @data.status == "Closed"
					close_date = Date.strptime(@data.date , "%Y-%m-%d")
					
				else #for status open 				
					close_date = Date.strptime(@data.last_close_date, "%Y-%m-%d")
				end
				# check date

				if condition_date >= close_date
					return true 
				else
					return false
				end


			else
				return true 
			end

		rescue Exception => e
			puts "=========error ========"
			puts e
			return false 
			
		end
		
	end
end
