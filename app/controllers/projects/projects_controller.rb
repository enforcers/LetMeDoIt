class Projects::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = Project.active.paginate(
      :page => params[:page],
      :conditions => (params.has_key?(:category_id) ? "category_id = #{params[:category_id].to_i}" : "")
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
        flash[:success] = 'Project was successfully created.'
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
    @project = Project.find(params[:id])
    @categories = Category.where(:category_id => nil)
  end
  
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to project_path(@project),  notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end