require 'rspec'
require 'spec_helper'

describe "Projects - " do
	describe "Registered User" do
		before(:each) do
			create_logged_in_user
			@user = create_logged_in_user
			@project = FactoryGirl.create(:project , user_id: @user.id )
			visit project_path(@project)
		end

		it "creates project with first task" do
			visit new_project_path
			page.should_not have_content("not authorized")
			within("#project-fieldset") do
				fill_in "Name", :with => "Test Project"
				fill_in "Description", :with => "Test Description"
				select "Mac2", :from => "Category"
			end

			within("#task-fieldset") do
				fill_in "Name", :with => "Test Task"
				fill_in "Description", :with => "Test Description"
				fill_in "Budget", :with => "500"
			end

			click_on("Create Project")
			page.should have_content('Project was successfully created.')
		end

		it "edits a project" do
			click_on("Edit Project")
			select "Mac2", :from => "Category"
			click_on("Update Project")
			page.should have_content('Project was successfully updated.')
		end

		it "delete an existing project" do
			expect { click_link('Delete Project') }.to change(Project, :count).by(-1)
			page.should have_content('Project was successfully deleted.')
		end
	end

	describe "unknown User" do
		it "shouldnt be able to create project" do
			visit new_project_path
			page.should have_content("not authorized")
		end
	end
end