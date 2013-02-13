class Projects::BidsController < ApplicationController
	def create
		@bid = Bid.new(params[:bid])
		@task = @bid.task

		respond_to do |format|
		  if @bid.save
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
	end
end