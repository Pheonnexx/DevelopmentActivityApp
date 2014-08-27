class DevActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_dev_activity, only: [:show, :edit, :update, :destroy]

  # GET /dev_activities
  # GET /dev_activities.json
  def index
    @dev_activities = DevActivity.all
  end

  # GET /dev_activities/1
  # GET /dev_activities/1.json
  def show

  end

  # GET /dev_activities/new
  def new
    @dev_activity = DevActivity.new
  end

  # GET /dev_activities/1/edit
  def edit
  end

  # POST /dev_activities
  # POST /dev_activities.json
  #Uses the current user that is logged in and creates a dev activity that belongs to them
  def create
    @dev_activity = current_user.dev_activities.create(dev_activity_params)

    respond_to do |format|
      if @dev_activity.save
        format.html { redirect_to @dev_activity, notice: 'Dev activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dev_activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @dev_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_activities/1
  # PATCH/PUT /dev_activities/1.json
  def update
    respond_to do |format|
      if @dev_activity.update(dev_activity_params)
        format.html { redirect_to @dev_activity, notice: 'Dev activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dev_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_activities/1
  # DELETE /dev_activities/1.json
  def destroy
    @dev_activity.destroy
    respond_to do |format|
      format.html { redirect_to dev_activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_activity
      @dev_activity = DevActivity.find(params[:id])
    end

    #Finds the current user if needed
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #These are the allowed parameters for creating and amending a dev activity - these need to be expanded for any new ones.
    def dev_activity_params
      params.require(:dev_activity).permit(:user_id, :dev_type, :activity_completed_at, :time_taken, :notes, :key_learning_point)
    end
end
