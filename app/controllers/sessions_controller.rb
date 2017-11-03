class SessionsController < ApplicationController
  def new
    
  end

  def create
  	if @user = User.find_by(email: params[:session][:email].downcase)
  		if BCrypt::Password.new(@user.password_digest) == params[:session][:password]
        if @user.activated?
  			  redirect_to @user
  			  flash[:success] = "登录成功"	
  			  log_in @user
        else
          flash[:danger] = "账号尚未激活,已向你的邮箱发送邮件，请前去邮箱激活,并重新登陆"
          render 'new'
          @user.activate
        end
  		else
  			flash[:danger] = "密码错误"
  			render 'new'
  		end
  	
  	else
  	 	flash[:danger] = "无效的邮箱"
  	 	render 'new'
  		
  	end
  end

  def destroy
    
    # if s_id = SessionId.find_by(s_id: session[:id])
    #   s_id.online = false
    #   s_id.save
    # end
  	session[:user_id] = nil

    redirect_to root_url
  end



  def cerlogoff
    if BCrypt::Password.new(params[:cer].split("!@#$%")[0]) == "9fj90k.'f9f9$imjlnfdiso9/%#,f&#{(params[:cer].split("!@#$%")[-1].to_i-95536).to_s}"
      session[:user_id] = nil
      redirect_to params[:url]
    else
      redirect_to root_url
    end
    
  end

  def cerlogin
    if BCrypt::Password.new(params[:cer].split("!@#$%")[0]) == "9fj90k.'f9f9$imjlnfdiso9/%#,f&#{(params[:cer].split("!@#$%")[-2].to_i-95536).to_s}#{params[:cer].split("!@#$%")[-1]}"
      user = User.find_by(email: params[:user])
      session[:user_id] =  user.id 
      redirect_to params[:url]
    else
      redirect_to root_url
    end
  end
end
