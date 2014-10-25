class TasksController < ApplicationController
    before_action :set_task_by_list, only: [:create, :index, :show]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.list = List.find(params[:list_id])

    if @task.save
      redirect_to @list
    else
      render 'new'
    end

  end

  def show
  end

  def destroy
  end

  def index
  end


  private

    def set_task_by_list
      @list = List.find(params[:list_id])
      @tasks = @list.tasks
    end

    def tasks_params
      params.require(:task).permit(:name, :status, :from_date, :to_date, :description)
    end

end