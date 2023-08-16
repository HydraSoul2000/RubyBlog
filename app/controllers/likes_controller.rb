class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to @post, notice: 'Liked!'
    else
      redirect_to @post, alert: 'Like could not be added.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user: current_user)

    if @like.destroy
      redirect_to @post, notice: 'Like removed.'
    else
      redirect_to @post, alert: 'Like could not be removed.'
    end
  end
end
