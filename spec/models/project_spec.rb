describe Project do 
	it { should belong_to(:customer) }
	it { should have_many(:tasks) }
end