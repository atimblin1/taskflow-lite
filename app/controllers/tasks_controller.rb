class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :complete, :reopen]
  
  def index
    @open_tasks = Task.active.open.by_priority(params[:priority]).recent
    @completed_tasks = Task.active.completed.by_priority(params[:priority]).recent
    @current_priority = params[:priority]
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task deleted successfully.'
  end
  
  def complete
    if @task.complete!
      redirect_to tasks_path, notice: 'Task marked as completed.'
    else
      redirect_to tasks_path, alert: 'Could not complete task.'
    end
  end
  
  def reopen
    if @task.reopen!
      redirect_to tasks_path, notice: 'Task reopened.'
    else
      redirect_to tasks_path, alert: 'Could not reopen task.'
    end
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :description, :status, :priority)
  end
end
