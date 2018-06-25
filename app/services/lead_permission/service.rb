class LeadPermission::Service
	def get_user_permission user_id
		user = User.joins(:role).where("users.id=#{user_id} and roles.is_admin=#{true}")	
		if !user.nil? && !user.empty?
			return true
		end
	end

end
