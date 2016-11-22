class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
   @tasks = Task.all
  end

  def show
  end

  def edit
    # ...
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @restaurant.save
    # no need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def update
      @task.update(task_params)
      redirect_to task_path(@task)
  end
  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :description, :done)
  end
 end
