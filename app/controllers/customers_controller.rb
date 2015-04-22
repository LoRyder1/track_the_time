class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@c = Customer.find(params[:id])
		@p = @c.projects
		te = []
		@p.each do |x|
			te << Timeentry.where(project_id: x.id)
		end
		@tes = te[0]
		respond_to do |format|
			format.html
			format.xls { send_data @tes.to_csv(col_sep: "\t") }
		end
	end

	def new
		@c = Customer.new
	end

	def create
		@c = Customer.new(customer_params)
		@c.save
		redirect_to customers_path
	end

	private
	def customer_params
		params.require(:customer).permit(:company)
	end
end
