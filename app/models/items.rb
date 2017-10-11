class Items < ActiveRecord::Base
	belongs_to :item_category, foreign_key: 'category_id'
	belongs_to :item_type, foreign_key: 'item_type_id'
	belongs_to :ums , :foreign_key => "um_id"
	belongs_to :currency , :foreign_key => "currency_id"
	has_many :sale_quotation_detail , foreign_key:'item_id'
	has_many :opening_stock_detail, foreign_key: "item_id"
	has_many :adjust_stock_detail, foreign_key: "item_id"
	has_many :maintenance_detail, foreign_key: "item_id"
	has_many :invoice_detail, foreign_key: "item_id"
	has_many :transfer_stocks, foreign_key: "item_id"
   has_many :item_price , foreign_key:"item_id"

   validates_uniqueness_of :code

   # validates_presence_of :item_price
   accepts_nested_attributes_for :item_price , :allow_destroy => true

end
