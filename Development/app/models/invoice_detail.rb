class InvoiceDetail < ActiveRecord::Base
	belongs_to :invoice , foreign_key:'invoice_id'
	belongs_to :ums , foreign_key:'um_id'
	belongs_to :items , foreign_key:'item_id'      
	audited :associated_with => :invoice
	
end
