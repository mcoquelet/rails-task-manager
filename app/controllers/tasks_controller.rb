class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.create!(task_params_create)
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update!(task_params_update)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params_create
    params.require(:task).permit(:title, :details)
  end

  def task_params_update
    params.require(:task).permit(:title, :details, :completed)
  end
end
