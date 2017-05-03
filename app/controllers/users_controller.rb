class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    if User.all.ids.include?(params[:id].to_i)
      @user = User.find(params[:id])
      @posts = @user.posts.paginate(page: params[:page])
    else
      redirect_to root_url
      flash[:danger] = "could not find the user."
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params) 
  	if @user.save 
      log_in @user
  		render 'show'
  	else

  		render 'new'
      flash[:danger] = "error messages."
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "修改成功"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    def set_user
      @user = User.find(params[:id]) if User.all.ids.include?(params[:id].to_i)
    end

    def correct_user
      set_user
      redirect_to root_url unless current_user? @user
    end

end
