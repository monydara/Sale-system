class AdjustStockDetail < ActiveRecord::Base
	belongs_to :adjust_stock, foreign_key: "adjust_stock_id"
	belongs_to :ums, foreign_key: "um_id"
	belongs_to :items, foreign_key: "item_id"
	belongs_to :adjust_stock_type , foreign_key: "adjust_type_id"
end
