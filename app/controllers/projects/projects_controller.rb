class Projects::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    # Select only active projects
    conditions = ""
    conditions << "id IN (SELECT project_id FROM tasks WHERE due_date >= '#{Date.today}')"
    conditions << " AND id IN (SELECT project_id FROM tasks WHERE bid_id IS NULL)"
    conditions << (params.has_key?(:category_id) ? " AND category_id = #{params[:category_id].to_i}" : "")

    @projects = Project.paginate(
      :page => params[:page],
      :conditions => conditions,
      :order => "created_at DESC"
    )

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
    @project.tasks.build
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
    @projects = Project.paginate(:page => params[:page], :conditions => ["user_id = ?", current_user], :order => "created_at DESC")
    respond_to do |format|

      format.html # index.html.erb
      format.json {
        render json: {
          :projects => @projects
        }
      }
    end
  end

  def edit
  end

  def update
  end
end