module AdminHelper
	def is_admin(user)
		return !!User.find_by_id(user.id).roles.find_by_id(1)
	end
end
