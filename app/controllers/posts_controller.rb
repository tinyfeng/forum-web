class PostsController < ApplicationController
	def show
		@post = Post.find(params[:id])
		@contents = @post.contents.paginate(page: params[:page])
	end

	def create
		@post = current_user.posts.build(subject: params[:post][:subject])
		@first_content = @post.contents.build(ct: params[:post][:ct])
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


end
