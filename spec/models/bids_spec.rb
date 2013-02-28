require 'rspec'
require 'spec_helper'

describe "Bid" do
	before(:each) do
		@task = FactoryGirl.create(:task)
		@bid = FactoryGirl.create(:bid, task_id: @task.id)
#		@task = Task.find(@bid.task_id)
	end

	it "belongs to a user" do
		@bid.should belong_to(:user)
	end

	it "belongs to a task" do
		@bid.should belong_to(:task)		
	end

	it "needs an amount" do
		@bid.should validate_presence_of(:amount)	
	end

	it "needs an amount within the range" do 
  		@bid.should be_valid
  		@bid.amount = 0
  		@bid.should_not be_valid
  		@bid.amount = @task.budget + 1
  		@bid.should_not be_valid
	end

	it "amount is numeric" do
		@bid.should validate_numericality_of(:amount)
	end

	it "exists only once per user and task" do
		@bid2 = FactoryGirl.create(:bid, task_id: @task.id)
  		@bid2.user_id = @bid.user_id
  		@bid2.should_not be_valid
	end
end