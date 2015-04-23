feature 'Login Page' do 

	context 'login page' do
		before(:each) do 
			@bob = User.create!(username:'bob', email: 'bob@mail.com', password:'password')
			visit login_path
		end

		it 'will show the login page' do
			expect(page).to have_content 'Sign In'
			expect(page).to have_content 'Login'
		end

		it 'redirects to index page from login page if logged in' do
			fill_in 'user_email', with:'bob@mail.com'
			fill_in 'user_password', with: 'password'
			first('input[type="submit"]').click
			visit login_path
			expect(page).to_not have_content('Sign In')
			visit root_path
			expect(page).to_not have_content('Login')
		end
	end
end
