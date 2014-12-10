class SkillGroupsController < ApplicationController
  before_action :set_skill_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @skill_groups = SkillGroup.all
    respond_with(@skill_groups)
  end

  def show
    respond_with(@skill_group)
  end

  def new
    @skill_group = SkillGroup.new
    respond_with(@skill_group)
  end

  def edit
  end

  def create
    @skill_group = SkillGroup.new(skill_group_params)
    @skill_group.save
    respond_with(@skill_group)
  end

  def update
    @skill_group.update(skill_group_params)
    respond_with(@skill_group)
  end

  def destroy
    @skill_group.destroy
    respond_with(@skill_group)
  end

  private
    def set_skill_group
      @skill_group = SkillGroup.find(params[:id])
    end

    def skill_group_params
      params[:skill_group]
    end
end
