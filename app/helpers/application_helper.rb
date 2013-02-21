module ApplicationHelper
	def render_form_errors(*args)
		errors = Array.new
		output = ""

		args.each do |error_object|
			errors.concat(error_object.full_messages) unless error_object.nil?
		end

		return nil if errors.blank?

		output <<
		content_tag(:div, :class => "alert alert-error") do
			content_tag(:button, "&times;".html_safe, :class => "close", :'data-dismiss' => "alert") +
			content_tag(:strong, pluralize(errors.count, "Error") + " prohibited this form from being saved:") +
			content_tag(:ul) do
				errors.each do |message|
					concat(content_tag(:li, message))
				end
			end
		end

		return output.html_safe
	end
end
