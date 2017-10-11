class CustomerBalance < ActiveRecord::Base
  belongs_to :currency , foreign_key: 'currency_id'
end
