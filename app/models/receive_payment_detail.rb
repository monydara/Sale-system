class ReceivePaymentDetail < ActiveRecord::Base
	belongs_to :receive_payment , foreign_key:"receive_payment_id", optional: true 	
	belongs_to :invoice , foreign_key:'invoice_id', optional: true

	def self.get_paid_amount_by_invoice inv_id,currency_id
		self.where( invoice_id:inv_id , currency_id: currency_id).group(:invoice_id).sum(:amount)
	end
end
