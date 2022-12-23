class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.includes(:author)
    
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @post.comments
        else
          render html: "You are not authorized "
        end
      end
    end
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

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @user.decrement!(:post_counter)
    @post.destroy
    redirect_to user_posts_path, notice: 'Deleted Post'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
