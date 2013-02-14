class Projects::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
  	@projects = params.has_key?(:category_id) ? 
      Project.paginate(:page => params[:page], :conditions => ["category_id = ?", params[:category_id].to_i], :joins => ["inner join tasks on tasks.project_id = project.id where tasks.bid_id IS NULL and tasks.due_date >= ?",DateTime.now.to_date], :order => "created_at DESC") :
      Project.paginate(:page => params[:page], :order => "created_at DESC")

    @categories = Category.where(:category_id => nil) # Only parent categories
    respond_to do |format|
      format.html # index.html.erb
      format.json {
      	render json: {
      		:projects => @projects,
      		:categories => @categories
      	}
      }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @categories = Category.where(:category_id => nil) # Only parent categories

    respond_to do |format|
      format.html # new.html.erb
      format.json {
      	render :json => {
      	  :projects => @proejcts,
      	  :categories => @categories
      	}
      }
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @categories = Category.where(:category_id => nil) # Only parent categories

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project) }
        format.json { render json: @project, status: :created, location: project_path(@project) }
      else
        format.html { render action: "new" }
        format.json {
        	render json: {
        		:'project.errors' => @project.errors,
        		:categories => @categories
        	},
        	status: :unprocessable_entity
        }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = Task.where(:project_id => @project.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def self
  end

  def edit
  end

  def update
  end
end