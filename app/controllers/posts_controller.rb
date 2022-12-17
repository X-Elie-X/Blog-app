class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @post = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end
end
