class ApplicationController < ActionController::Base
  #before_action :update_login, :is_login?
  #protect_from_forgery with: :exception
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

  


  

end
