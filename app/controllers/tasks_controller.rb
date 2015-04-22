class TasksController < ApplicationController
	def index
		@tasks = Task.all		
	end

	def new
		@t = Task.new
	end

	def create
		@t = Task.new(task_params)
		@t.save
		redirect_to tasks_path
	end

	private
	def task_params
		params.require(:task).permit(:task_name,:project_id)
	end
end

