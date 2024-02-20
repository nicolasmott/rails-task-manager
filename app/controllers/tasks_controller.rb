def index
  @tasks = Task.all
end

def show
  @task = Task.find(params[:id])
end

def new
  @task = Task.new
end

def create
  @task = Task.new(task_params)
  @task.save
  # No need for app/views/restaurants/create.html.erb
  redirect_to task_path(@task)
end

private

def task_params
  params.require(:task).permit(:name, :address, :rating)
end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
end

def update
  @task = Task.find(params[:id])
  @task.update(task_params)
  # No need for app/views/restaurants/update.html.erb
  redirect_to task_path(@task)
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # [...]

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
