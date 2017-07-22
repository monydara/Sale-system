class Customer < ActiveRecord::Base
	belongs_to :area , foreign_key:'customer_area_id'
	has_many :invoice , foreign_key:'customer_id'
	has_many :sale_quotation , :foreign_key => "customer_id"
	has_many :receive_payment  , foreign_key:'customer_id'
   belongs_to :contact , foreign_key:'contact_id'
	# audited #use for audit table
	has_many :maintenance, foreign_key: 'customer_id'

   validates_uniqueness_of :name , scope: :legal_name,message: "and legal name already exist in system"
end
