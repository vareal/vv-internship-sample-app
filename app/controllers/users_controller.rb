class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(show index edit update)
  before_action :find_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :check_admin, only: :destroy

  def index
    @users = User.user.where(activated: true).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def show
   @microposts  = @user.microposts.order_micropost.page(params[:page]).per(5)
    return if @user.activated

    redirect_to root_url
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @user = User.update user_params
    if @user
      flash[:success] = "Updated Sucssess"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to :js
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  def find_user
    @user = User.find params[:id]
  end

  def correct_user
    return if current_user? @user

    redirect_to root_path
    flash[:danger] = "Can't access this user"
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
