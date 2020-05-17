class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 2 ).order('created_at ASC')
  end

  def show
    @post = Post.friendly.find(params[:id])
    @comments = Comment.where(post_id: @post)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    post = Post.friendly.find(params[:id])
    post.update(post_params)
    redirect_to post
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :short_description, :image, :slug)
  end


end
