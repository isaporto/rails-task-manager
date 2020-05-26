class TasksController < ApplicationController
  before_action :get_one_task, only: [:show, :edit, :update, :destroy]
  def index
    @all_tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task.id)
  end

  def edit
  end

  def update
    @one_task.update(task_params)

    redirect_to task_path(@one_task.id)
  end

  def destroy
    @one_task.destroy

    redirect_to tasks_path
  end

  private

  def get_one_task
    @one_task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
