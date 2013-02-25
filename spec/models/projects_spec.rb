require 'rspec'
require 'spec_helper'

describe "Projects" do
	before(:each) do
		@project = FactoryGirl.create(:project)
	end

	it "needs a user" do
		@project.user_id = nil
		@project.should_not be_valid
		@project.user_id = 1
		@project.should be_valid
	end

	it "needs a description" do
		@project.description = nil
		@project.should_not be_valid
		@project.description = 'test project description'
		@project.should be_valid
	end

	it "needs a name" do
		@project.name = nil
		@project.should_not be_valid
		@project.name = 'test project'
		@project.should be_valid
	end

	it "needs a category" do
		@project.category_id = nil
		@project.should_not be_valid
		@project.category_id = 1
		@project.should be_valid
	end
end