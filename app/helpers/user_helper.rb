module UserHelper
	def generate_hover_profile (user = nil)
		return link_to(user.contactName, user_show_path(user), :class => "profile-hover") unless user.nil?
	end
end