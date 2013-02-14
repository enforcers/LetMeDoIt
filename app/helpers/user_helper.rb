module UserHelper
	def generate_hover_profile (user = nil)
		if !user.nil?
			inner_popover = ""
			inner_popover << "<div class=\"photo\">#{image_tag user.photo.url(:small)}</div>"
			inner_popover << "<div class=\"profile-name\">#{user.contactName}</div>"
			inner_popover << "<div class=\"short\">#{user.aboutMe}</div>"
			html = link_to user.contactName, user_show_path(user), {
						:title => "",
						:class => "profile-hover",
						:data => {
							:toggle => "popover",
							:trigger => "hover",
							:placement => "top",
							:container => "body",
							:html => "true",
							:content => inner_popover
						}
					}
			html << '<script type="text/javascript">$(function() { $(".profile-hover").popover(); });</script>'.html_safe
			return html
		end
	end
end