require "spec_helper"

describe "bid emails" do
#  include ActionController::UrlWriter

  before(:all) do

  end

  subject { @email }
  
  it "should send out a bid_accepted email" do

  end

  it "should send out a bid_declined email" do

  end

  it "should send out a bid_notification email" do
    bid = FactoryGirl.create(:bid)
    email = bid.task.project.user.email
    puts email
  end
  
  
end
