class ApplicationController < ActionController::Base
  before_action :update_login, :is_login?
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :current_user

  def current_user?(user)
    @current_user = current_user
    @current_user == user
  end

  def current_post
    Post.find(params[:post_id]) if Post.all.ids.include?(params[:post_id].to_i)
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id].present? && User.all.ids.include?(session[:user_id])
  end
  
  def logged_in?
    session[:user_id].present?
  end
  
  def log_in(user)
  	session[:user_id] = user.id
  end

  def authenticated?()
  end
  
  def store_location
     session[:forwarding_url] = "http://tnforum.tiny.com" + (request.original_url).split("?")[0].split("http://127.0.0.1:3001")[1] if request.get?
  end

  def authen_url?(url)
    if BCrypt::Password.new(url[:f]) == "9fj90k.'f9f9$imjlnfdiso9/%#,f&#{(url[:time].to_i-95536).to_s}#{url[:user]}"
      user = User.find_by(email: url[:user])
      log_in user
      redirect_to user
    else
      redirect_to "http://sso.tiny.com/login?url=http://tnforum.tiny.com/login/"
    end
  end

  def update_login
    session[:user_id] = nil   if current_user && current_user.online == false  
  end

  def is_login?
    if !logged_in? 
      if  params[:unlogin] == nil
        redirect_to "http://sso.tiny.com/login?url=#{store_location}&login=1"
      # else
      #  if params[:session_id].present?
      #     session[:id] = params[:session_id]
      #     s_id = SessionId.find_by(s_id: session[:id])
      #     if params[:unlogin] == "2" && s_id.online == true
      #       redirect_to "http://localhost:3000/login?url=#{store_location.split("?")[0]}&login=1"
      #     #debugger
      #     end
      #   end
      end        
    end
  end

  

end
