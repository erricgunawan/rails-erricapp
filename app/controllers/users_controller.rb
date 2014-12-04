class UsersController < ApplicationController

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

  private

    def user_params
    	params.require(:user).permit(
    		:name, :email, :password, :password_confirmation)
    end
end
