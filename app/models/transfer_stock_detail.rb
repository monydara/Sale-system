class TransferStockDetail < ActiveRecord::Base
	belongs_to :transfer_stock , :foreign_key=>"transfer_stock_id"
	belongs_to :items, foreign_key:"item_id"
	belongs_to :ums, foreign_key:"um_id"
	audited :associated_with => :transfer_stock
end
