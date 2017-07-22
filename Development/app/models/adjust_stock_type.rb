class AdjustStockType < ActiveRecord::Base
	has_many :adjust_stock_detail , foreign_key: "adjust_type_id"
end
