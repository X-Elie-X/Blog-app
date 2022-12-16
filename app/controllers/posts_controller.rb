class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
