class CustomerTransaction < ActiveRecord::Base
  belongs_to :invoice , optional:true
end
