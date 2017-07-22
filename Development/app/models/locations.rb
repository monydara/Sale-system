class Locations < ActiveRecord::Base
	# has_many :transfer_stock, foreign_key: ''
	has_many :opening_stock, foreign_key: "location_id"
	has_many :adjust_stock, foreign_key: "location_id"

	has_many :transfer_stock ,:foreign_key => "from_location_id"
	has_many :transfer_stock ,:foreign_key => "to_location_id"
end
