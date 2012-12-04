  # GET /projects/task/new
  # GET /projects/task/new.json
  def new
    @task = Task.new
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json {
      	render :json => {
      	  :task => @task,
      	  :project => @project
      	}
      }
    end
  end