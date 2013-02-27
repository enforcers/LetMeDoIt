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

	def breadcrumb(*args)
		active = args[0]
		options = args.extract_options!
		step = options[:step]
		html = options[:html]
		buttons = options[:buttons]

		content_tag :ul,
			content_tag(:li, link_to("Projects", projects_path) + content_tag(:span, "/", :class => "divider")) +
			(if active.instance_of? Project
				if step.nil?
					content_tag(:li, link_to(active.category.name, projects_path(:category_id => active.category)) + content_tag(:span, "/", :class => "divider")) +
					content_tag(:li, active.name, :class => "active")
				else
					content_tag(:li, step.to_s, :class => "active")
				end
			elsif active.instance_of? Task
				content_tag(:li, link_to(active.project.category.name, projects_path(:category_id => active.project.category)) + content_tag(:span, "/", :class => "divider")) +
				if step.nil?
					content_tag(:li, link_to(active.project.name, project_path(active.project)) + content_tag(:span, "/", :class => "divider")) +
					content_tag(:li, active.name, :class => "active")
				else
					content_tag(:li, link_to(active.project.name, project_path(active.project)) + content_tag(:span, "/", :class => "divider")) +
					content_tag(:li, step.to_s, :class => "active")
				end
			elsif (active.nil? && !step.nil?)
				unless params[:category_id].blank?
					content_tag(:li, link_to(Category.find(params[:category_id]).name, projects_path(:category_id => params[:category_id])) + content_tag(:span, "/", :class => "divider")) +
					content_tag(:li, step.to_s, :class => "active")
				else
					content_tag(:li, step.to_s, :class => "active")
				end
			end).to_s.html_safe +
			(if buttons
				content_tag(:div,
					if active.instance_of? Project
						if can? :update, active
							content_tag(:div,
								link_to("Actions <i class=\"caret\"></i>".html_safe, "#", :class => "btn btn-primary dropdown-toggle", :'data-toggle' => "dropdown") +
								content_tag(:ul,
									content_tag(:li, link_to("Edit Project", edit_project_path(active))) +
									content_tag(:li, link_to("Delete Project", project_path(active), :method => :delete, :confirm => "Are you sure?")) +
									content_tag(:li, nil, :class => "divider") +
									(if can? :create, Task
										content_tag(:li, link_to("Add Task", new_project_task_path(active)))
									end).to_s.html_safe,
								:class => "dropdown-menu"),
							:class => "btn-group")
						end
					elsif active.instance_of? Task
						(if (can?(:create, active.bids.build) & active.bids.pop) # removing temporary bid buildt from can? check
							content_tag(:div,
								link_to("Place bid", "#", :class => "btn btn-primary", :data => { :toggle => "modal", :target => "#place-bid" }),
							:class => "btn-group")
						end).to_s.html_safe +
						(if can? :update, active
							content_tag(:div,
								link_to("Actions <i class=\"caret\"></i>".html_safe, "#", :class => "btn btn-primary dropdown-toggle", :'data-toggle' => "dropdown") +
								content_tag(:ul,
									content_tag(:li, link_to("Edit Task", edit_project_task_path(active.project, active))) +
									content_tag(:li, link_to("Delete Task", project_task_path(active.project, active), :method => :delete, :confirm => "Are you sure?")),
								:class => "dropdown-menu"),
							:class => "btn-group")
						end).to_s.html_safe
					end,
				:class => "pull-right")
			end).to_s.html_safe,
		:class => "breadcrumb"
	end
end
