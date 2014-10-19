class TasksController < ApplicationController
    before_action :set_user, only: [:create, :destroy]


  def create
     @task = @list.tasks.create(ltask_params)

      redirect_to list_path(@user)
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy

    redirect_to list_path(@list)
  end


  private

    def set_list
      @list = List.find(params[:list_id])
    end
    def tasks_params
      params.require(:list).permit(:name, :status, :from_date, :to_date, :description)
    end



end
