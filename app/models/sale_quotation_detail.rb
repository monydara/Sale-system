class SaleQuotationDetail < ActiveRecord::Base
	belongs_to :sale_quotation , foreign_key:"sale_quotation_id" , optional:true
	belongs_to :ums , foreign_key:'um_id'
	belongs_to :item_sku , foreign_key:'item_id'
	#audited :associated_with => :sale_quotation
end
