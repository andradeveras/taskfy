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


  def edit 
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task was successfully destroyed."
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
