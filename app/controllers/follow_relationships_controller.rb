class FollowRelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :destroy]

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user, flash: {success: 'フォローしました！'} }
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:follow_relationship][:following_id])
  end
end
