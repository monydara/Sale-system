class SaleQuotation < ActiveRecord::Base
	has_many :sale_quotation_detail , :foreign_key => "sale_quotation_id"
   belongs_to :customer , :foreign_key => "customer_id"
	belongs_to :lead , :foreign_key => "lead_id"
	belongs_to :sale_representative , :foreign_key => "sale_representative_id"
	has_many :invoice , foreign_key:'sale_quotation_id'
 	accepts_nested_attributes_for :sale_quotation_detail , :allow_destroy => true

# 	has_associated_audits


 	validates_presence_of :sale_quotation_detail
   validates_uniqueness_of :sale_quotation_no , message:" already exist in system"
end
