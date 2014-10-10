class UsersLinemanagersController < ApplicationController
  before_action :set_users_linemanager, only: [:show, :edit, :update, :destroy]

  def user_search
    @search = User.search(params[:q])
    @users = @search.result #.includes(:user)
  end

  # GET /users_linemanagers
  # GET /users_linemanagers.json
  def index
    @users_linemanagers = UsersLinemanager.all
  end

  # GET /users_linemanagers/1
  # GET /users_linemanagers/1.json
  def show
  end

  # GET /users_linemanagers/new
  def new
    @search = User.search(params[:q])
    @users = @search.result #.includes(:user)
    @users_linemanager = UsersLinemanager.new
  end

  # GET /users_linemanagers/1/edit
  def edit
  end

  # POST /users_linemanagers
  # POST /users_linemanagers.json
  def create
    @users_linemanager = UsersLinemanager.new(users_linemanager_params)

    respond_to do |format|
      if @users_linemanager.save
        format.html { redirect_to :back, notice: "You are now Linemanaging #{@users_linemanager.user.first_name} #{@users_linemanager.user.surname}." }
        format.json { render action: 'show', status: :created, location: @users_linemanager }
      else
        format.html { render action: 'new' }
        format.json { render json: @users_linemanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_linemanagers/1
  # PATCH/PUT /users_linemanagers/1.json
  def update
    respond_to do |format|
      if @users_linemanager.update(users_linemanager_params)
        format.html { redirect_to @users_linemanager, notice: 'Users linemanager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @users_linemanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_linemanagers/1
  # DELETE /users_linemanagers/1.json
  def destroy
    @users_linemanager.destroy
    respond_to do |format|
      format.html { redirect_to users_linemanagers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_linemanager
      @users_linemanager = UsersLinemanager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_linemanager_params
      params.require(:users_linemanager).permit(:linemanager_id, :user_id)
    end
end
