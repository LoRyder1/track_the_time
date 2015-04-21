class Task < ActiveRecord::Base
	has_one :timeentry
	belongs_to :project
end
