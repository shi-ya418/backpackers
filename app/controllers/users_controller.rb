class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @username = current_user.username
    @posts = current_user.posts
  end
end
