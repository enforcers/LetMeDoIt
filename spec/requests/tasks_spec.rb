require 'rspec'
require 'spec_helper'

describe "Task - " do
	describe "Registered User" do
		it 'adds a new task to his project' do
			@user = create_logged_in_user
			@project = FactoryGirl.create(:project , user_id: @user.id )

			visit project_path(@project)

			page.should have_content('Task(s) on this project')

			click_on('Add Task')
			fill_in "Name", :with => "new Task Name"
			fill_in "Description", :with => "new Task Description"
			click_on('Create Task')

			page.should have_content('Task was successfully created.')
		end
		it 'adds a task to others Project' do
			@user = create_logged_in_user
			@project = FactoryGirl.create(:project)
			page.should_not have_button('Add Task')

		end

		it 'edits his own task' do
			@user = create_logged_in_user
			@project = FactoryGirl.create(:project , user_id: @user.id )
			@task = FactoryGirl.create(:task, project_id: @project.id)
			visit project_task_path(@project, @task)
			click_on('Edit Task')
			click_on('Update Task')
			page.should_not have_button('Task was successfully updated.')
		end

		it 'edits others task' do
			@user = create_logged_in_user
			@task = FactoryGirl.create(:task)
			@project = Project.find(@task.project_id)
			visit project_task_path(@project, @task)
			page.should_not have_button('Edit Task')

		end
	end
end