class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :complete, :reopen]
  
  def index
    @open_tasks = current_tasks.active.open.by_priority(params[:priority]).recent
    @completed_tasks = current_tasks.active.completed.by_priority(params[:priority]).recent
    @current_priority = params[:priority]
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_tasks.new(task_params)
    
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
  
  def current_tasks
    Task.for_visitor(current_visitor_id)
  end
  
  def set_task
    @task = current_tasks.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end
  
  def task_params
    params.require(:task).permit(:title, :description, :status, :priority)
  end
end
