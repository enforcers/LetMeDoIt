require 'rspec'
require "spec_helper"

describe "confirmation email" do

  subject { @email }

  it "should be sent after registration" do
    reset_email
    user = FactoryGirl.create(:user)
    email = user.email
    last_email.should include(email)
  end
end

describe "bid email" do

  before(:all) do
    reset_email
  end

  subject { @email }
  
  it "should be sent out as bid_accepted email" do
    bid = FactoryGirl.create(:bid)
    task = bid.task

    task.accepted = bid.id
    task.save

    last_email.to.should include(bid.user.email)
  end

  it "should be sent out as bid_declined email" do
    task = FactoryGirl.create(:task)
    bid1 = FactoryGirl.create(:bid, :task => task)
    bid2 = FactoryGirl.create(:bid, :task => task)

    task.accepted = bid1.id
    task.save

    last_email.to.should include(bid2.user.email)
  end

  it "should be sent out as bid_notification email" do
    bid = FactoryGirl.create(:bid)
    email = bid.task.project.user.email

    last_email.to.should include(email)
  end
end