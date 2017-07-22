class AdjustStock < ActiveRecord::Base
	has_many :adjust_stock_detail, foreign_key: "adjust_stock_id"
	belongs_to :locations, foreign_key: "location_id"
	accepts_nested_attributes_for :adjust_stock_detail, :allow_destroy => true
end
