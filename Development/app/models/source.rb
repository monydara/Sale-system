class Source < ActiveRecord::Base
	has_many :lead , :foreign_key => "source_id" 
end
