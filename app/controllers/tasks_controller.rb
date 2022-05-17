class TasksController < ApplicationController
  before_action :find, only: [:task, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def task; end

  def new
    @task = Task.new
  end

  def save
    @task = Task.new(title: params['task']['title'], details: params['task']['details'])
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @find_task.update(task_params)

    redirect_to task_path(@find_task)
  end

  def destroy
    @find_task.destroy

    redirect_to tasks_path
  end

  private

  def find
    @find_task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
