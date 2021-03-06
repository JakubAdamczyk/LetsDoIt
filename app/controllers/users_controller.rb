class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end
  
  def destroy
  end

  def index
    @users = User.all
  end

  def update
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email)
    end

end

