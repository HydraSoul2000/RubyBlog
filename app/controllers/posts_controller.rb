class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created successfully.'
    else
      render :new
    end
  end

  def my_posts
    @my_posts = current_user.posts
  end

  # Add edit, update, and destroy actions
  # ...

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
