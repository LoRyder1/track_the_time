class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@c = Customer.find(params[:id])
		@p = @c.projects
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
