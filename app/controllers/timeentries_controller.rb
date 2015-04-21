class TimeentriesController < ApplicationController
	def index
		@timee = Timeentry.all	
	end

	def new
		@timeentry = Timeentry.new
	end

	def edit
		@timee = Timeentry.find(params[:id])
		@d = Time.now - (@timee.start_time)
	end

	def create
		@timeentry = Timeentry.new(timeentry_params)

		@timeentry.user_id = current_user.id
		
		@timeentry.save
		redirect_to timeentries_path
	end

	def start_timer
		timee = Timeentry.find(params[:id])
		timee.start_time = Time.now
		timee.save!

		redirect_to timeentries_path
	end

	def stop_timer
		timee = Timeentry.find(params[:id])

		if timee.duration == nil
			timee.duration = Time.now - (timee.start_time)
		else
			timee.duration = timee.duration + (Time.now - (timee.start_time))
		end

		timee.save
		redirect_to timeentries_path
	end

	private
	def timeentry_params
		params.require(:timeentry).permit(:note, :project_id, :task_id)
	end
end
