class ContentsController < ApplicationController
	before_action :set_model, only: [:destroy]

	def create
		@content = current_post.contents.build(content_params)
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

	def destroy
		@content.destroy
		post = @content.post
		post.content_count -= 1
		post.save
		redirect_to @content.post
	end

	private
		def content_params
			params.require(:content).permit(:ct)
		end

		def set_model
			@content = Content.find(params[:id])
		end
end




	
