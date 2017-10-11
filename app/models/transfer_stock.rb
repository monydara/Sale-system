class TransferStock < ActiveRecord::Base
	has_many :transfer_stock_detail , :foreign_key => "transfer_stock_id"
	belongs_to :locations ,:foreign_key => "from_location_id"
	belongs_to :locations ,:foreign_key => "to_location_id"
 	accepts_nested_attributes_for :transfer_stock_detail, :allow_destroy => true
 	audited
 	has_associated_audits
end
