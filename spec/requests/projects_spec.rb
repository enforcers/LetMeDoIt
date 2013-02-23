require 'spec_helper'

describe "Projects" do
	describe "Login User" do
		it "creates project" do
			sign_in_as_a_valid_user
			visit new_project_path
			puts(current_user.inspect)
			page.should_not have_content("not authorized")

			within("#project-fieldset") do
				fill_in "Name", :with => "Test Project"
				fill_in "Description", :with => "Test Description"
				select 4, :from => "Category"
			end
		end
	end
end