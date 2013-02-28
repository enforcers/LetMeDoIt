require 'rspec'
require 'spec_helper'

describe "Project" do
	before(:each) do
		@project = FactoryGirl.create(:project)
	end

	it "belongs to a user" do
		@project.should belong_to(:user)
	end

	it "belongs to a category" do
		@project.should belong_to(:category)	
	end	

	it "has many tasks" do
		@project.should have_many(:tasks)
	end

	it "needs a description" do
		@project.should validate_presence_of(:description)	
	end

	it "needs a name" do
		@project.should validate_presence_of(:name)	
	end
end