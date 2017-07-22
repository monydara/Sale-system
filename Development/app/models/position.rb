class Position < ActiveRecord::Base
	has_many :sale_reporesentative , :foreign_key => "position_id"
end
