require "spec_helper"

describe "bid emails" do
  before(:all) do
    reset_email
  end

  subject { @email }
  
  it "should send out a bid_accepted email" do
    bid = FactoryGirl.create(:bid)
    task = bid.task

    task.accepted = bid.id
    task.save

    last_email.to.should include(bid.user.email)
  end

  it "should send out a bid_declined email" do
    task = FactoryGirl.create(:task)
    bid1 = FactoryGirl.create(:bid, :task => task)
    bid2 = FactoryGirl.create(:bid, :task => task)

    task.accepted = bid1.id
    task.save

    last_email.to.should include(bid2.user.email)
  end

  it "should send out a bid_notification email" do
    bid = FactoryGirl.create(:bid)
    email = bid.task.project.user.email

    last_email.to.should include(email)
  end
  
  
end