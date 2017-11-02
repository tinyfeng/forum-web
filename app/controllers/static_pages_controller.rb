class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  def home
    Count.add
    topposts = []
    topposts = Post.all.map{ |f|
      f if f.top } - [nil]
  	@posts = (topposts | Post.all).paginate(page: params[:page])
  end

  def about
  end
end
