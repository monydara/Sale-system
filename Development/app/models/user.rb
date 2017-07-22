class User < ActiveRecord::Base
   attr_encrypted :password, :key => 'y5net'
   belongs_to :role, foreign_key:"role_id"
   validates_uniqueness_of :username
end
