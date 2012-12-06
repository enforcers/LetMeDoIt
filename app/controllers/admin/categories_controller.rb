class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = Category.where(:category_id => nil) # Only parent categories
    @category = Category.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => { :categories => @categories, :category => @category } }
    end
  end

  # GET /users/new
  # GET /users/new.json
  #def new
  #  @category = Category.new
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render :json => @user }
  #  end
  #end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url }
        format.json { render json: @category, status: :created, location: @category }
      else
        @categories = Category.where(:category_id => nil)
        format.html { render action: "index" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :ok }
    end
  end
end
