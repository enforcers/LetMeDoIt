require "spec_helper"

describe "bid emails" do
#  include ActionController::UrlWriter

  before(:all) do
    @email = Mailer.create_signup("thatsmyway1234@trash-mail.com", "tom jones")
  end

  subject { @email }
  
  it "should send out a bid_accepted email" do
  	mail()
    should deliver_to("thatsmyway1234@trash-mail.com")
  end

  it "should send out a bid_declined email" do
  	mail()
    should deliver_to("thatsmyway1234@trash-mail.com")
  end

  it "should send out a bid_notification email" do
  	mail()
    should deliver_to("thatsmyway1234@trash-mail.com")
  end
  
  
end
