class Projects::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
  	@projects = params.has_key?(:category) ? Project.where(:category_id => params[:category]) : Project.all
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
        format.html { redirect_to project_show_path(@project) }
        format.json { render json: @project, status: :created, location: project_show_path(@project) }
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
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def edit
  end

  def update
  end
end