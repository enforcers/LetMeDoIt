class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # If this show page is only for the currently logged in user change it to @user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end
end