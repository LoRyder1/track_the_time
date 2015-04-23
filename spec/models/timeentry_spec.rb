describe Timeentry do 
	it { should belong_to(:project) }
	it { should belong_to(:user) }
	it { should belong_to(:task) }
end