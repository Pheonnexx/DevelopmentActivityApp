class RoleSkillsController < ApplicationController
  before_action :set_role_skill, only: [:show, :edit, :update, :destroy]

  # GET /role_skills
  # GET /role_skills.json
  def index
    @role_skills = RoleSkill.all
  end

  # GET /role_skills/1
  # GET /role_skills/1.json
  def show
  end

  # GET /role_skills/new
  def new
    @role_skill = RoleSkill.new
  end

  # GET /role_skills/1/edit
  def edit
  end

  # POST /role_skills
  # POST /role_skills.json
  def create
    @role_skill = RoleSkill.new(role_skill_params)

    respond_to do |format|
      if @role_skill.save
        format.html { redirect_to @role_skill, notice: 'Role skill was successfully created.' }
        format.json { render action: 'show', status: :created, location: @role_skill }
      else
        format.html { render action: 'new' }
        format.json { render json: @role_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_skills/1
  # PATCH/PUT /role_skills/1.json
  def update
    respond_to do |format|
      if @role_skill.update(role_skill_params)
        format.html { redirect_to @role_skill, notice: 'Role skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_skills/1
  # DELETE /role_skills/1.json
  def destroy
    @role_skill.destroy
    respond_to do |format|
      format.html { redirect_to role_skills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_skill
      @role_skill = RoleSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_skill_params
      params[:role_skill]
    end
end
