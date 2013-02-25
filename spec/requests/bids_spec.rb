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

			click_button('Place bid')

			within("#bid-fieldset") do
				fill_in 'amount', :with => 123
			end
			
			click_button('Place bid')

			page.should_not have_content('Error')
		end
	end
end