class TasksController < ApplicationController
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
    Task.new(restaurant_strong_params).save
    redirect_to tasks_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(restaurant_strong_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path(@task)
  end

  private

  def restaurant_strong_params
    params.require(:task).permit(:title, :details)
  end
end
