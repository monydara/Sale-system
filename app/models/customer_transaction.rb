class CustomerTransaction < ActiveRecord::Base
  belongs_to :invoice , optional:true
  belongs_to :customer , optional:true
  belongs_to :transaction_type , optional:true 
end
