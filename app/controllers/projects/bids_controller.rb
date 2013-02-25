class Projects::BidsController < ApplicationController
	load_and_authorize_resource :task
	load_and_authorize_resource :bid, :through => :task, :shallow => true

	def create
		@bid = Bid.new(params[:bid])
		@task = @bid.task

		respond_to do |format|
		  if @bid.save
		  	flash[:success] = 'Bid has been placed.'
		  	Mailer.bid_notification(@bid).deliver
		  	Notification.fire(@task.project.user, @bid, 1)

		    format.html { redirect_to project_task_path(@task.project, @task) }
		    format.json { render json: @task, status: :created, location: project_task_path(@task.project, @task) }
		  else
		    format.html { render "projects/tasks/show" }
		    format.json {
		      render json: {
		        :'bid.errors' => @bid.errors
		      },
		      status: :unprocessable_entity
		    }
		  end
		end
	end

	def self
		@bids = case params[:show]
			when "accepted"
				Bid.accepted.where(:user_id => current_user)
			when "declined"
				Bid.declined.where(:user_id => current_user)
			else # open
				Bid.open.where(:user_id => current_user)
		end

		@bids = @bids.paginate(:page => params[:page])

    	respond_to do |format|

	      format.html do
	      	if request.xhr?
	      		render 'mybids-table', :layout => false
	      	else
	      		render # index.html.erb
	      	end
	      end

	      format.json {
	        render json: {
	          :projects => @projects
	        }
	      }
	    end
	end
end