class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    redirect_to root_url unless @post = Post.find(params[:id])
  end
  
end