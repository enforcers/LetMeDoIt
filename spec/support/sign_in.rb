# module for helping request specs
require 'spec_helper'
include Warden::Test::Helpers

module SignIn
  # for use in request specs

  def create_logged_in_user
    user ||= FactoryGirl.create :user
    login(user)
    user
  end
  def login(user)
    login_as user, :scope => :user
  end
end