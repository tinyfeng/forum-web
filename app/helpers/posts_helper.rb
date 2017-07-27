module PostsHelper
  def admin_user?(user)
      return user.admin
  end 
end
