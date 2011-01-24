class PostsController < ApplicationController
  before_filter :require_super_user
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    else
      render :edit
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_url
    else
      render :edit
    end
  end
end
