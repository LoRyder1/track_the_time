feature 'Welcome Page' do
	context 'home page' do 
		before(:each) do 
			visit root_path
		end

		it ' will show the welcome page ' do
			expect(page).to have_content 'Welcome to Track the Time Homey'
		end
	end
end