class ListsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]


  def create
     @list = @user.lists.create(list_params)

      redirect_to user_path(@user)
  end

  def destroy
    @list = @user.lists.find(params[:id])
    @list.destroy

    redirect_to user_path(@user)
  end


  private

    def set_user
      @user = User.find(params[:user_id])
    end
    def list_params
      params.require(:list).permit(:name,)
    end

end
