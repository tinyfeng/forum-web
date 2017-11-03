class UserMailer < ApplicationMailer
  def activate(user)
    @user = user
    mail(to: @user.email, subject: "激活账号")
  end
end
