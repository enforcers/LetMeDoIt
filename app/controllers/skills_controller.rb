class SkillsController < ApplicationController
  load_and_authorize_resource

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to edit_user_registration_path(current_user, :show => 'skills') }
        format.json { render json: @skill, status: :created, location: edit_user_registration_path(current_user) }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to edit_user_registration_path(current_user, :show => 'skills') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to edit_user_registration_path(current_user, :show => 'skills') }
      format.json { head :no_content }
    end
  end
end
