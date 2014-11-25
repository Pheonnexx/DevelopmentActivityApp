class UsersController < ApplicationController
  before_action :find_skills, only: [:show, :destroy]
  before_action :find_roles, only: [:show, :create, :edit]
  #before_action :set_linemanager, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @search = User.search(params[:q])
    @users = @search.result #.includes(:user)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    find_roles
  end

  def linemanager_team
    @user = current_user 
    @linemanager = Linemanager.find_by(:user_id => @user.id) 
    @linemanaged_team1 = User.joins(:users_linemanagers).where('users_linemanagers.linemanager_id' => @linemanager.id).to_a
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(password_params)
      sign_in @user, :bypass => true
      redirect_to @user, notice: 'Your password was successfully changed.'
    else
      render "edit_password"
    end
  end

  # POST /users
  # POST /users.json
  # Creates the user - 
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Currently not in use - will change this to redirect to mainpage when utilised
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Finds the user when an ID is provided

    def find_skills
      @user = User.find(params[:id])
      @user_skill = UserSkill.where("user_id = @user.id")
    end

    def find_roles
      @user = User.find(params[:id])
      @role = Role.where("id = @user.role_id")
    end

    def set_linemanager
      @linemanaged_by = UsersLinemanager.find_by(:user_id => @user.id)
      if @linemanaged_by
        @linemanager = Linemanager.find_by(:user_id => @linemanaged_by.linemanager_id) 
      else
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Any new parameters need to be added here as well as in the user controller to have them store correctly
    def user_params
      params.require(:user).permit(:first_name, :surname, :email, :role_id, :admin, :line_manager)
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
end
