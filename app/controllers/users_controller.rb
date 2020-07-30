class UsersController < ApplicationController
  def show
    # user = User.find(params[:id])
    @username = current_user.username
    @posts = current_user.posts
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
