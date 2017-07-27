module PostsHelper
  def admin_user?(user)
    return user.admin if user.present? 
  end 
end
