class StaticPagesController < ApplicationController
  def home
  	@posts = Post.all.paginate(page: params[:page])
  end
end
