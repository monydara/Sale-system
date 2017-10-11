class Maintenance < ActiveRecord::Base
	has_many :maintenance_detail, foreign_key: "maintenance_id"
	belongs_to :customer, foreign_key: "customer_id"
	belongs_to :invoice, foreign_key: "invoice_id"
	accepts_nested_attributes_for :maintenance_detail, :allow_destroy => true
end