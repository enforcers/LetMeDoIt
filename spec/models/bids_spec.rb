require 'rspec'
require 'spec_helper'

describe "Bid" do
	before(:each) do
		@bid = FactoryGirl.create(:bid, amount: 500)
		@task = Task.find(@bid.task_id)
	end
	it "should be valid" do
		@task.inspect
		@bid.should be_valid
	end

	it "needs a user" do
		@bid.user_id = nil
		@bid.should_not be_valid
		@bid.user_id = 1
		@bid.should be_valid
	end

	it "needs an amount" do
		@bid.amount = nil
		@bid.should_not be_valid
		@bid.amount = 500
		@bid.should be_valid
		
	end

	it "needs a task" do
		@bid.task_id = nil
		@bid.should_not be_valid
		@bid.task_id = @task.id
		@bid.should be_valid
	end
end