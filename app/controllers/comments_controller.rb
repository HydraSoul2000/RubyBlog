class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment added successfully.'
    else
      redirect_to @post, alert: 'Comment could not be added.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
