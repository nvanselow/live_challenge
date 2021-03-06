def sign_in_as(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button('Sign In')

  expect(page).to have_content('Sign Out')
  expect(page).not_to have_content('Sign In')
end

def sign_out
  visit root_path

  within('nav') do
    click_link 'Sign Out'
  end

  expect(page).to have_content('Signed out successfully')
end
