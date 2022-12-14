class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.order(created_at: :desc).paginate page: params[:page]
  end 

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the E-Learning System!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @user.update user_params
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
  end
end
