class LinemanagersController < ApplicationController
  before_action :set_linemanager, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /linemanagers
  # GET /linemanagers.json
  def index

  end

  # GET /linemanagers/1
  # GET /linemanagers/1.json
  def show
  end

  # GET /linemanagers/new
  def new
    @user = current_user.id
    @linemanager = @user.linemanagers.build
  end

  # GET /linemanagers/1/edit
  def edit
  end

  # POST /linemanagers
  # POST /linemanagers.json
  def create
    @linemanager = @user.linemanagers.new(linemanager_params)

    respond_to do |format|
      if @linemanager.save
        format.html { redirect_to @linemanager, notice: 'Linemanager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @linemanager }
      else
        format.html { render action: 'new' }
        format.json { render json: @linemanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linemanagers/1
  # PATCH/PUT /linemanagers/1.json
  def update
    respond_to do |format|
      if @linemanager.update(linemanager_params)
        format.html { redirect_to @linemanager, notice: 'Linemanager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @linemanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linemanagers/1
  # DELETE /linemanagers/1.json
  def destroy
    @linemanager.destroy
    respond_to do |format|
      format.html { redirect_to linemanagers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linemanager
      @user = current_user
      @linemanager = Linemanager.where("user_id = @user.id")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linemanager_params
      params.require(:linemanager).permit(:user_id)
    end
end
