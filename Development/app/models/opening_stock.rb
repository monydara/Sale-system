class OpeningStock < ActiveRecord::Base
	has_many :opening_stock_detail, :foreign_key => "opening_stock_id"
	belongs_to :locations, foreign_key: "location_id"
	accepts_nested_attributes_for :opening_stock_detail, :allow_destroy => true
end
