class Projects::BidsController < ApplicationController
	def create
		@bid = Bid.new(params[:bid])
		@task = @bid.task

		respond_to do |format|
		  if @bid.save
		    format.html { redirect_to projects_task_path(@task) }
		    format.json { render json: @task, status: :created, location: projects_tasks_show_path(@task) }
		  else
		    format.html { render action: "show" }
		    format.json {
		      render json: {
		        :'task.errors' => @task.errors
		      },
		      status: :unprocessable_entity
		    }
		  end
		end
	end
end