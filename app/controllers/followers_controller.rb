class FollowersController < ApplicationController
  def index
    @user = current_user
    @title = "Following"
    @users = @user.following
                  .page(params[:page])
                  .per 10
    render "users/show_follow"
  end
end
