class Roles::Service
	def get_menu role_id
		@data = []
		
		if !role_id.nil?
			@data = Role.find_by_sql "
				SELECT
				    m.id menu_id,
				    m.menu,
				    rm.id,
				    CASE
				        WHEN rm.id > 0 THEN TRUE
				        ELSE FALSE
				    END AS checked,
				    ms.menu AS parent_name
				FROM
				    sys_menus m
				        LEFT JOIN
				    sale_system.rel_menu_roles rm ON m.id = rm.menu_id and rm.role_id = #{ role_id }
				        LEFT JOIN
				    sys_menus ms ON ms.id = m.parent_id
				    where m.parent_id > 0 and m.is_active = true
				;


			"
		end

		@data

	end

	def save_menu params
		@data = params[:data]
		puts "=== #{@data} "


	end

end
