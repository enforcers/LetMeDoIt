require 'rspec'
require 'spec_helper'

describe "Bid" do
	describe "Login User" do
		it "places a bid" do
			@task = FactoryGirl.create :task
			@project = Project.find(@task.project_id)
			create_logged_in_user
			visit project_task_path(@project, @task)

			page.should have_content('Bid(s) on this Task')

			within("#new_bid") do
				fill_in "Amount", :with => 123
				click_button('Place bid')
			end

			page.should_not have_content('Error')
		end

		it "places a too high amount" do
			@task = FactoryGirl.create :task
			@project = Project.find(@task.project_id)
			create_logged_in_user
			visit project_task_path(@project, @task)

			page.should have_content('Bid(s) on this Task')

			within("#new_bid") do
				fill_in "Amount", :with => 5000
				click_button('Place bid')
			end

			page.should have_content('Please ensure that your bid is in range for the budget.')
		end

		it "places a second bid" do
			@task = FactoryGirl.create :task
			@project = Project.find(@task.project_id)
			create_logged_in_user
			visit project_task_path(@project, @task)

			page.should have_content('Bid(s) on this Task')

			within("#new_bid") do
				fill_in "Amount", :with => 123
				click_button('Place bid')
			end

			page.should_not have_content('Error')

			page.should have_button('Place bid')
		end

	end
end