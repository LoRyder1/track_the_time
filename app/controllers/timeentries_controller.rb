class TimeentriesController < ApplicationController
	def new
		@projects = Project.all
		@task = Task.find(params[:task_id])
		@timeentry = Timeentry.new
	end

	def create
		@task = Task.find(params[:task_id])
		@timeentry = Timeentry.new(timeentry_params)
		s = Time.now
		@timeentry.start_time = s
		@timeentry.user_id = current_user.id
		@timeentry.task_id = @task.id
		@timeentry.save
		redirect_to tasks_path
	end

	private
	def timeentry_params
		params.require(:timeentry).permit(:note, :project_id)
	end
end
