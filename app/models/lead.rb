class Lead < ActiveRecord::Base

   def self.update_status_converted id
      data = self.find id
      data.update_attributes status:6
   end

   # relationship
	belongs_to :area , foreign_key:"lead_area_id"
   belongs_to :contact , foreign_key:'contact_id'
   belongs_to :look_up , foreign_key:'status'
   belongs_to :sale_representative, foreign_key:'lead_owner'
   belongs_to :source , foreign_key: "source_id"
   belongs_to :user, foreign_key: "created_by"
   # validation
   validates_uniqueness_of :name  , scope: :legal_name
end
