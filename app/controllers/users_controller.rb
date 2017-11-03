class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :show]
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
    if User.all.each.map{|f| f.name}.include?(@user.name)
      flash[:danger] = "用户名已存在"
      render 'new'       
      return
    end
    if User.all.each.map{|f| f.email}.include?(@user.email.downcase)
      flash[:danger] = "邮箱已存在"
      render 'new'      
      return  
    end   
  	if @user.save 
      flash[:danger] = "已经向你的邮箱发送了邮件，快去激活吧"
      @user.activate
      redirect_to login_url
  	else
      flash[:danger] = "error"
  		render 'new'      
  	end
  end

  def activate
    user = User.find(params[:uid])
    if BCrypt::Password.new(params[:token]) == "#{params[:uid]}987654"
      flash[:success] = "激活成功，请登陆"
      user.activation = true
      user.save
    end
    redirect_to  login_url
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
