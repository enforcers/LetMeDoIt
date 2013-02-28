require 'rspec'
require 'spec_helper'

describe "Task - " do
	describe "Registered User" do
		before(:each) do
			@user = create_logged_in_user
			@project = FactoryGirl.create(:project , user_id: @user.id )
			@task = FactoryGirl.create(:task, project_id: @project.id)
		end
		it 'adds a new task to his project' do
			visit project_path(@project)
			page.should have_content('Task(s) on this project')
			click_on('Add Task')
			fill_task_form
			click_on('Create Task')
			page.should have_content('Task was successfully created.')
		end

		it 'adds a task to others Project' do
			page.should_not have_button('Add Task')
		end
		before(:each) do
			visit project_task_path(@project, @task)
		end
		
		it 'edits his own task' do
			click_on('Edit Task')
			click_on('Update Task')
			page.should_not have_button('Task was successfully updated.')
		end

		it 'edits others task' do
			page.should_not have_button('Edit Task')
		end

		it 'delete own task' do
			expect { click_link('Delete Task') }.to change(Task, :count).by(-1)
			page.should have_content('Task was successfully deleted.')
		end
	end
end