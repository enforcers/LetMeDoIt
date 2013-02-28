require 'rspec'
require 'spec_helper'

describe "Task" do
	before(:each) do
		@task = FactoryGirl.create(:task)
	end

	it "belongs to a project" do
		@task.should belong_to(:project)
	end

	it "has many bids" do
		@task.should have_many(:bids)
	end

	it "needs an name" do
		@task.should validate_presence_of(:name)	
	end

	it "needs an description" do
		@task.should validate_presence_of(:description)	
	end

	it "needs an due date" do
		@task.should validate_presence_of(:due_date)	
	end

	it "needs an budget" do
		@task.should validate_presence_of(:budget)	
	end

	it "budget is numeric" do
		@task.should validate_numericality_of(:budget)
	end

	it "is valid" do
		@task.due_date = Date.yesterday()
		@task.should be_valid		
	end


end