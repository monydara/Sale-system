class SysMenu < ActiveRecord::Base
	 has_many :rel_menu_role, foreign_key:'menu_id'
end
