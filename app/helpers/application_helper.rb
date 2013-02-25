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

	def paginate *params
		params[1] = {} if params[1].nil?
		params[1][:renderer] = BootstrapPaginationHelper::LinkRenderer
		params[1][:previous_label] = "&laquo;".html_safe
		params[1][:next_label] = "&raquo;".html_safe
		params[1][:class] = "pagination pagination-centered"
		will_paginate *params
	end
end
