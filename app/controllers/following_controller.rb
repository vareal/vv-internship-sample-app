class FollowingController < ApplicationController
  def index
    @user = current_user
    @title = "Follower"
    @users = @user.followers
                  .page(params[:page])
                  .per 10
    render "users/show_follow"
  end
end
