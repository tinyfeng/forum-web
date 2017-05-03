class ContentsController < ApplicationController

	def create
		@content = current_post.contents.build(ct: params[:content][:ct])
		@content.user_id = current_user.id
		if  @content.valid?
			@content.post.content_count += 1
			@content.post.save
			@content.floor = @content.post.content_count
			@content.save
			flash[:success] = "回复成功"
			redirect_to current_post
		else
			flash[:success] = "回复失败，请检查内容是否为空或长度过长"
			redirect_to current_post
		end
	end
end




	
