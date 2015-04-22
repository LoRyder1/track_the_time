# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create!(username:"bob", display_name:"bob", email:"bob@mail.com", password:"password")

c = Customer.create!(company:"CoverMyMeds")

p = Project.create!(project_name:"Lays of Rome", customer_id: c.id)

t = Task.create!(task_name:"Temples and Gods", project_id: p.id)

te = Timeentry.create!(project_id:p.id, user_id:u.id, task_id:t.id, duration:120.543, start_time:Time.now, note:Faker::Lorem.sentence)

require 'csv'

class Seiko
	attr_reader :company, :address1, :address2, :address3, :city, :state, :zip, :phone1, :phone2, :fax1, :fax2, :email, :website
	def initialize(options={})
		@company = options[:company]
		@address1 = options[:address1]
		@address2 = options[:address2]
		@address3 = options[:address3]
		@city = options[:city]
		@state = options[:state]
		@zip = options[:zip]
		@phone1 = options[:phone1]
		@phone2 = options[:phone2]
		@fax1 = options[:fax1]
		@fax2 = options[:fax2]
		@email = options[:email]
		@website = options[:website]	
	end	
end

class Parse
	attr_reader :companies, :filename
	def initialize(filename)
		@companies = []
		@filename = filename
	end

	def delete_blank_spaces
		f = File.new(filename).to_a
		no_bl = f.each {|s| s.gsub!(/\r/, '')}
		File.open('db/rfmted_customers.csv', 'w+') do |x|
			x.puts no_bl
		end
	end

	def load_companies(file)
		CSV.foreach(file, headers: true,  header_converters: :symbol, skip_blanks: true) do |row_data|
			@companies << Seiko.new(row_data)
		end
	end

	def create_companies
		companies.each do |c|
			Customer.create!(:company =>c.company, :address1 =>c.address1, :address2 =>c.address2, :address3 =>c.address3, :city =>c.city, :state =>c.state, :zip =>c.zip, :phone1 =>c.phone1, :phone2 =>c.phone2, :fax1 =>c.fax1, :fax2 =>c.fax2, :email =>c.email, :website =>c.website)
		end
	end
end

parse = Parse.new('db/Customers.csv')

parse.delete_blank_spaces

parse.load_companies('db/rfmted_customers.csv')

# p parse.companies

parse.create_companies





