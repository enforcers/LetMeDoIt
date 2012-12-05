class Admin::AdminController < ApplicationController
  prepend_view_path 'app/views/admin'
  before_filter :verify_admin

  def verify_admin
    :authenticate_user!
    redirect_to root_url unless has_role?(current_user, 'admin')
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end

  def dashboard
  	render '/dashboard.html.erb'
  end
end
