class Projects::BidsController < ApplicationController
	def create
		@bid = Bid.new(params[:bid])
		@task = @bid.task

		respond_to do |format|
		  if @bid.save

		  	Mailer.bid_notification(@bid).deliver
		  	Notification.fire(@bid.user, @bid, 1)

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
		@bids = Bid.paginate(:page => params[:page], :conditions => ["user_id = ?", current_user], :order => "created_at DESC")
    	respond_to do |format|

	      format.html # index.html.erb
	      format.json {
	        render json: {
	          :projects => @projects
	        }
	      }
	    end
	end

end