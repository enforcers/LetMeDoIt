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

#	it "needs an amount within the range" do
#		@budget = task.budget
#		@bid.should ensure_inclusion_of(:amount).in_range(1..:budget)
#	end

	it "amount is numeric" do
		@bid.should validate_numericality_of(:amount)
	end

	# it "exists only once per user and task" do
	# 	@user = FactoryGirl.create(:user)
	# 	@bid.should validate_uniqueness_of(@bid.user_id).scoped_to(@bid.task_id)
	# end
end