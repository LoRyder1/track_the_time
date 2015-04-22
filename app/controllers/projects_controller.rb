class ProjectsController < ApplicationController
	def new
		@c = Customer.find(params[:customer_id])
		@p = Project.new
	end

	def create
		@p = Project.new(project_params)
		@p.customer_id = params[:customer_id]
		@p.save

		redirect_to customer_path(@p.customer)
	end

	private
	def project_params
		params.require(:project).permit(:project_name)
	end
end
