class TasksController < ApplicationController
  def index
    # read all tasks
    @tasks = Task.all
  end

  def show
    # show one task
    @task = Task.find(params[:id])
  end

  def new
    # display the new form
    @task = Task.new
  end

  def create
    # create the task and store it in DB
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
