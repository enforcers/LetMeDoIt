require 'rspec'
require 'spec_helper'

describe "Task" do
	before(:each) do
		@task = FactoryGirl.create(:task)
	end
	# it "needs a project" do
	# 	@task.project_id = nil
	# 	@task.should_not be_valid
	# 	@task.project_id = 1
	# 	@task.should be_valid
	# end

	it "needs a name" do
		@task.name = nil
		@task.should_not be_valid
		@task.name = 'test task'
		@task.should be_valid
	end

	it "needs a description" do
		@task.description = nil
		@task.should_not be_valid
		@task.description = 'test task description blabla'
		@task.should be_valid
	end

	it "needs a due date" do
		@task.due_date = nil
		@task.should_not be_valid
		@task.due_date = '2013-05-06'
		@task.should be_valid
	end

	it "is valid" do
		@task.due_date = Date.yesterday()
		@task.should be_valid		
	end
end