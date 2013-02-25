class Projects::TasksController < ApplicationController
  load_and_authorize_resource :except => [:new]

  # GET /projects/task/new
  # GET /projects/task/new.json
    def index
    @tasks = params.has_key?(:project_id) ? Task.where(:project_id => params[:project_id]) : Task.all
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render json: {
          :tasks => @tasks
        }
      }
    end
  end

  def new
    @task = Task.new
    #@project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json {
      	render :json => {
      	  :task => @task
      	}
      }
    end
  end

  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        flash[:success] = 'Task was successfully created.'
        format.html { redirect_to project_task_path(@task.project, @task) }
        format.json { render json: @task, status: :created, location: project_task_path(@task.project, @task) }
      else
        format.html { render action: "new" }
        format.json {
          render json: {
            :'task.errors' => @task.errors
          },
          status: :unprocessable_entity
        }
      end
    end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def edit
    @task = Task.find(params[:id])

  end
  
  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])

        if params[:task].has_key?(:accepted)
          Mailer.bid_accepted(@task).deliver
          bid = Bid.find(params[:task][:accepted])
          Notification.fire(bid.user, bid, 2)
        end

        format.html { redirect_to project_task_path(@task.project, @task),  notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_path(@task.project) }
      format.json { head :no_content }
    end
  end

end