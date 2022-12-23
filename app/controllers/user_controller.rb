class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_post
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @user.posts
        else
          render html: 'You are not authorized'
        end
      end
    end
  end
end
