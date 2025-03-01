class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
