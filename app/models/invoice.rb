class Invoice < ActiveRecord::Base

	has_many :maintenance, foreign_key: 'invoice_id'
	belongs_to :customer , foreign_key:"customer_id"
	has_many :invoice_detail , foreign_key:'invoice_id'
	has_many :customer_transactions , foreign_key: 'transaction_id'
	belongs_to :sale_quotation , foreign_key:'sale_quotation_id' , optional: true

	has_many :receive_payment_detail , foreign_key:'invoice_id'

	belongs_to :user , foreign_key:'created_by'

	 # validates_presence_of :invoice_detail
 	accepts_nested_attributes_for :invoice_detail , :allow_destroy => true

	def self.get_unpaid_invoice_by_customer customer_id
		self.joins(:customer_transactions).where(customer_id:customer_id,payment_flag:[1,2] , status:"S" , :customer_transactions => { transaction_type_id: 2}).
				select("invoices.id as invoice_id , customer_transactions.amount as invoice_amount , unpaid_amount, paid_amount ,invoice_no , 0 balance , 0 amount ,
							 customer_transactions.currency_id  ")
	end

 	# audited
 	# has_associated_audits

end
