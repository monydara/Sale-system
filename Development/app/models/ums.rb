class Ums < ActiveRecord::Base
	has_many :items , :foreign_key => "um_id"
	has_many :item_price , foreign_key:"um_id"
	has_many :sale_quotation_detail , foreign_key:'um_id'
	has_many :opening_stock_detail, foreign_key: 'um_id'
	has_many :adjust_stock_detail, foreign_key: 'um_id'
	has_many :maintenance_detail, foreign_key: 'um_id'
	has_many :invoice_detail, foreign_key: 'um_id'
end
