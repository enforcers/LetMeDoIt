class UsersController < ApplicationController
  load_and_authorize_resource
  
  def show
    @user = User.find(params[:id])
    # If this show page is only for the currently logged in user change it to @user = current_user
    respond_to do |format|
      format.html do
        if request.xhr?
          render 'show-ajax', :layout => false
        else
          render # index.html.erb
        end
      end
      format.json { render json: @skill }
    end
  end

  def show_notifications
    @user = current_user
    @notifications = Notification.pull(@user)

    respond_to do |format|
      format.html # notifications.html.erb
      format.js { render :layout => false }
      format.json { render json: @notifications }
    end
  end

  def destroy_notification
  	@notification = Notification.find_by_id(params[:nid])
  	@notification.shown = true
  	@notification.save

    respond_to do |format|
      format.html { redirect_to my_notifications_path }
      format.js { head :no_content }
      format.json { head :no_content }
    end
  end
end