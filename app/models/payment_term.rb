class PaymentTerm < ActiveRecord::Base
   validates_uniqueness_of :payment_term_name
end
