class Area < ActiveRecord::Base
	has_many :customers , foreign_key:'customer_area_id'
	has_many :lead , foreign_key:'lead_area_id'
end
