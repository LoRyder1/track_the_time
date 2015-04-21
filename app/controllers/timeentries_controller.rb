class TimeentriesController < ApplicationController
	def index
		@tasks = Task.all	
	end

	def new
		projects = Project.all
		y = []
		projects.each do |x|
			y << x.project_name
			y << x.id
		end
		@p = y.each_slice(2).to_a

		tasks = Task.all
		z = []
		
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
