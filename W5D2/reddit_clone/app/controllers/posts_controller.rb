class PostsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # @subs = Sub.all
    # @post.sub_id = current_user.subs.find(params[:id])
    if @post.save
      # debugger
      redirect_to post_url(@post)
    else
      # debugger
      flash.now[:errors] = @post.errors.full_messages
      render :new 
    end 
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages 
      render :edit 
    end
  end

  def destroy
    @post = current_user.subs.find(params[:id]).posts.find(params[:id])
    @post.destroy 
    redirect_to sub_url(@post.sub_id)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
