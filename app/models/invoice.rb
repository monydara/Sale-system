class Invoice < ActiveRecord::Base

	has_many :maintenance, foreign_key: 'invoice_id'
	belongs_to :customer , foreign_key:"customer_id"
	has_many :invoice_detail , foreign_key:'invoice_id'
	belongs_to :sale_quotation , foreign_key:'sale_quotation_id' , optional: true

	has_many :receive_payment_detail , foreign_key:'invoice_id'

	belongs_to :user , foreign_key:'created_by'

	 validates_presence_of :invoice_detail
 	accepts_nested_attributes_for :invoice_detail , :allow_destroy => true

 	# audited
 	# has_associated_audits

end
