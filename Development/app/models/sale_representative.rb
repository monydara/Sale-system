class SaleRepresentative < ActiveRecord::Base
	has_many :sale_quotation , :foreign_key => "sale_representative_id"
	has_many :lead , :foreign_key => "lead_owner"
	belongs_to :position , :foreign_key => "position_id"
end
