class MaintenanceDetail < ActiveRecord::Base
	belongs_to :maintenance, foreign_key: "maintenance_id"
	belongs_to :items, foreign_key: "item_id" 
	belongs_to :ums, foreign_key: "um_id"
	
end
