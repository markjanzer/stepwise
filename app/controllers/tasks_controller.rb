class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
		@tasks = Task.all
		
  end

  def create
    @task = Task.new(task_params)

		if @task.save
			render json: @task
		else
			render json: @task.errors, status: :unprocessable_entity
		end
  end

  def update
		if @task.update(task_params)
			render json: @task
		else
			render json: @task.errors, status: :unprocessable_entity
		end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
		@task.destroy

    head :no_content
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
			
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:passion_id, :time_frame_id, :description, :due_date, :completed_at)
    end
end
