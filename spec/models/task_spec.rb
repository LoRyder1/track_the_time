describe Task do 
	it { should have_one(:timeentry) }
	it { should belong_to(:project) }
end