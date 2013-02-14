class HomeController < ApplicationController
  def index
  	@projects = Project.find(:all, :limit => 5, :order => "created_at DESC")
    
  	@users_count = User.all.count
  	@average_bids_per_project = (Bid.all.count.to_f / Project.all.count.to_f).round(1)
  	@active_projects = Project.get_active.count

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
