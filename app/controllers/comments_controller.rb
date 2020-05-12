class CommentsController < ApplicationController

  def create
    post = Post.find_by_id(comment_params[:post_id])
    Comment.create(comment_params)
    redirect_to post
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
