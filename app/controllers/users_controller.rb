class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout "comments", only: [:index]

  # GET /users
  # GET /users.json
  def index
    if session[:user].nil?
      redirect_to controller: 'static_pages', action: 'index'
    elsif session[:user]["isAdmin"]
      @users = User.all
    else
      @users = nil
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user] = @user
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        flash[:errors] = @user.errors
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # authenticate login params
  def login
    @user = User.find_by_username(params[:user]["username"])
    if(@user)
      if(@user.password == params[:user]["password"])
        flash[:user] = @user
        session[:user] = @user
        redirect_to controller: 'static_pages', action: 'home'
      else
        flash[:error] = "Username/Password incorrect"
        redirect_to controller: 'static_pages', action: 'index'
      end
    else
      flash[:error] = "User not found"
      redirect_to controller: 'static_pages', action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password, :email)
    end
end
