class ReceivePayment < ActiveRecord::Base
	has_many :receive_payment_detail , foreign_key:"receive_payment_id"
	belongs_to :customer , foreign_key:'customer_id'
 	accepts_nested_attributes_for :receive_payment_detail , :allow_destroy => true
	
end
