class CompanyProfileController < ApplicationController
	def index
		data = CompanyProfile.first
		render json:{ data:data , success:true}
	end

	def create
		data = CompanyProfile.first
		data.update_attributes(permit_data)

		render json:{ data:data , success:true }
	end
	def remove_image
		data = CompanyProfile.first
		data.update_attributes(image_file_name:nil)
		render json:{data:data , success:true}
	end
	def update
		data = CompanyProfile.first
		data.update_attributes(permit_data)
		url = data.image.url
		data.update_attributes(image_file_name:url)
		if data.valid?
			render json:{data:data , success:true}
		else
			render json:{error:data.errors , success:false}

		end
	end
	private
	def permit_data
		params.permit(
			:legal_name,
			:company_name,
			:tax_no,
			:mobile,
			:phone,
			:email,
			:website,
			:address,
			:image,
			:vat_tin,
			:account_no,
			:account_name,
			:bank_name
		)

	end

end
