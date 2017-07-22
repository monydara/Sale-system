class OpeningStockDetail < ActiveRecord::Base
	belongs_to :opening_stock, :foreign_key => "opening_stock_id"
	belongs_to :ums, foreign_key:"um_id"
	belongs_to :items, foreign_key: "item_id"
end
