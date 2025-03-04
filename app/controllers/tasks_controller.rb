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

  def toggle
    @task = Task.find(params[:id])
    new_status = !@task.completed
    @task.update(completed: new_status)
  
    respond_to do |format|
      format.turbo_stream
      format.html do
        message = new_status ? "Task marked as completed." : "Task marked as incomplete."
        redirect_to tasks_path, notice: message
      end
    end
  end
  

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
