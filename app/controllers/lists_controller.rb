class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update, :destroy]
  before_action :set_lists_by_user, only: [:index]

  # http_basic_authenticate_with name: "admin", password: "topsecret",
  # except: [:index, :show]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @tasks = @list.tasks
  end

  def index
  end
  
  def update

    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy

    redirect_to lists_path
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def set_lists_by_user
      @user = User.find(params[:user_id])
      @lists = @user.lists
    end

    def list_params
      params.require(:list).permit(:name)
    end
end