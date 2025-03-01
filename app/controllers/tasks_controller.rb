class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks = Task.new
  end
end
