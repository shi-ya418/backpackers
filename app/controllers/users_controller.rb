class UsersController < ApplicationController
  before_action :user_set, only: [:show, :followings, :followers]
  
  def show
    @posts = current_user.posts
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
    binding.pry
    if current_user.update(user_params)
      redirect_to root_path, notice: 'user情報が更新されました'
    else
      render :edit
    end
  end

  def followings
    @users =@user.followings
    render 'show_followings'
  end

  def followers
    @users =@user.followers
    render 'show_followers'
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :avatar)
  end

  def user_set
    @user =User.find(params[:id])
  end
  
end
