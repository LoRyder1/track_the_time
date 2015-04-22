class Timeentry < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :task

  def self.total(array)
  	a = []
  	array.each{ |x| a << x.duration } 
  	a.inject{|sum,x| sum += x }
  end

  def self.to_csv(options = {}) 
  	# headers = ["Task","Project","Notes","Duration"]
  	CSV.generate do |csv|
  		csv << column_names
  		all.each do |te|
  			csv << te.attributes.values_at(*column_names)
  		end
  	end
  end
end
