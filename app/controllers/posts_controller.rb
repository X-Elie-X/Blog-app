class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])

    @posts = Post.all.includes(:author, :comments, :likes)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find_by(id: params[:user_id])
    @post = @current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: ':( Cannot Create post retry again :('
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
