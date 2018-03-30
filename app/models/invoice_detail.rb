class InvoiceDetail < ActiveRecord::Base
	belongs_to :invoice , foreign_key:'invoice_id', optional: true
	belongs_to :ums , foreign_key:'um_id'
	belongs_to :item_sku , foreign_key:'item_id'
	belongs_to :currency , foreign_key: 'currency_id'
	# audited :associated_with => :invoice

end
