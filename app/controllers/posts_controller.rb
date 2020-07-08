class PostsController < ApplicationController
  before_action :admin, only: [:edit, :update, :new, :create]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 2 ).order('created_at ASC')
  end

  def show
    @post = Post.friendly.find(params[:id])
    @comments = Comment.where(post_id: @post)
    @comment = Comment.new
    @title = @post.title
    @image = @post.image
    @url = "https://www.indiehackerjourney.com/posts/#{@post.slug}"
    @shortDescription = @post.short_description
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

  def admin
    unless current_user && current_user.admin?
      flash[:danger] = "How dare you use your guile tactics on us!"
      redirect_to '/posts'
    end
  end


end
