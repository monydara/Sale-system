class LeadOpportunity < ActiveRecord::Base
   validates_uniqueness_of :code
   belongs_to :look_up , foreign_key:"status_id"
   belongs_to :customer , foreign_key:'customer_id'
   belongs_to :lead , foreign_key:'lead_id'
   belongs_to :sale_representative , foreign_key:"next_contact_by"
   belongs_to :contact , foreign_key:'contact_id'

   has_many :lead_opportunity_detail , foreign_key: :oppunity_id
   accepts_nested_attributes_for :lead_opportunity_detail , :allow_destroy => true


end
