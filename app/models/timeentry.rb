class Timeentry < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :task

  def self.total(array)
  	a = []
  	array.each{ |x| a << x.duration } 
  	a.inject{|sum,x| sum += x }
  end
end
