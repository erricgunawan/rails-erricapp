class UsersController < ApplicationController

  # before_action :logged_in_user, only: [:index]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :logged_in_user, except: [:show, :index]
  # after_action
  # around_action
  
  before_action :correct_user, only: [:edit, :update]
  # before_action :admin_user, only: [:edit, :update]

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  	# @user = User.new(name: 'Erric')
  end

  # def edit
  # 	@user = User.find(params[:id])
  # end

  def create

  	# render json: params and return
  	# render json: params[:user]
  	
  	# @user = User.new(params[:user])

  	# @user = User.new
  	# @user.name = params[:user][:name]
  	# @user.email = params[:user][:email]

  	@user = User.new(user_params)

  	#@user.save
    if @user.save
      do_login(@user)
      redirect_to user_url(@user), notice: 'User created!'
    else
      render :new
    end

  	# redirect_to root_path, notice: 'User created!'
    # redirect_to user_url(@user), notice: 'User created!'

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User updated!'
    else
      render edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url, notice: 'OK, User udah dihapus bro'
  end

  private

    def user_params
    	params.require(:user).permit(
    		:name, :email, :password, :password_confirmation)
    end
end
