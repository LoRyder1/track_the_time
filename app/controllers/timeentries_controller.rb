class TimeentriesController < ApplicationController
	def index
		@timee = Timeentry.where(user_id: current_user.id)	
		@t = Timeentry.total(@timee)
		respond_to do |format|
			format.html
			format.csv { send_data @timee.to_csv}
			format.xls { send_data @timee.to_csv(col_sep: "\t") }
		end
	end

	def new
		@timeentry = Timeentry.new
	end

	def edit
		@timee = Timeentry.find(params[:id])
		if @timee.start_time == nil
			render 'edit'
		else
			@t = Timeentry.new
			@d = Time.now - (@timee.start_time)
		end
	end

	def create
		@timeentry = Timeentry.new(timeentry_params)

		@timeentry.user_id = current_user.id
		
		@timeentry.save
		redirect_to timeentries_path
	end

	def update
		@timee = Timeentry.find(params[:id])
		@timee.duration = @timee.duration + (params[:timeentry][:start_time]).to_f
		@timee.save
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

		timee.start_time = 0
		timee.save
		redirect_to timeentries_path
	end


	private
	def timeentry_params
		params.require(:timeentry).permit(:note, :project_id, :task_id)
	end
end
