class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
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
    @my_posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      flash[:alert] = 'Error deleting post.'
      redirect_to post_path(@post)
    end
  end




  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
