class PostsController < ApplicationController
  before_action :set_model, only: [:show, :destroy]

	def show
		@contents = @post.contents.paginate(page: params[:page])
	end

	def create
		@post = current_user.posts.build(subject: post_params[:subject])
		@first_content = @post.contents.build(ct: post_params[:ct])
		@first_content.user_id = current_user.id
		if @first_content.valid?
				@first_content.floor = @post.content_count = 1
				@post.save
				@first_content.save
				flash[:success] = "新建帖子成功。"
				redirect_to @post 

		else
				redirect_to root_url
				flash[:danger] = "新建帖子失败，请检查内容是否为空，或长度过长。"
		end
	end

	def destroy
		@post.destroy
		redirect_to root_url
	end

	private
		def post_params
			params.require(:post).permit(:subject, :ct)
		end

		def set_model
			@post = Post.find(params[:id])
		end
end
