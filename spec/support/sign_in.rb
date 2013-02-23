# module for helping request specs
require 'spec_helper'

module SignIn
  # for use in request specs
  
  def sign_in_as_a_valid_user
    @user = FactoryGirl.create(:user)
    page.driver.post user_session_path, :user => {:email => user.email, :password => user.password}
  end
  def sign_in_as_admin
    page.driver.post user_session_path,
      :user => {:email => 'admin@admin.de', :password => 'admin5'}
  end


end