class ReceivePaymentDetail < ActiveRecord::Base
	belongs_to :receive_payment , foreign_key:"receive_payment_id"
	belongs_to :invoice , foreign_key:'invoice_id'
end
