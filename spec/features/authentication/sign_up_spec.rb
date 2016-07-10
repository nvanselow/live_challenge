require 'rails_helper'

feature 'sign_up', %{
  As an unauthenticated user
  I want to sign up
  So that I can start creating live challenges
} do

  # ACCEPTANCE CRITERIA
  # [X] I must specify a valid email addresses
  # [X] I must specify a valid password and confirm that password
  # [X] I must specify a valid display name
  # [X] If I do not perform the above, I get an error message
  # [X] If I specify valid information, I register my account
  # [X] Successful registration also results in being authenticated

  let(:user) { FactoryGirl.attributes_for(:user) }

  before do
    visit root_path

    within('nav') do
      click_link 'Sign Up'
    end
  end

  scenario 'specifying valid and required information' do
    fill_in 'Email', with: user[:email]
    fill_in 'Display Name', with: user[:display_name]
    fill_in 'Password', with: user[:password]
    fill_in 'Password Confirmation', with: user[:password]

    click_button 'Sign Up'

    expect(page).to have_content('You have signed up successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    click_button 'Sign Up'

    expect(page).not_to have_content('You have signed up successfully')
    expect(page).to have_content("Display name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'password does not match confirmation' do
    fill_in 'Email', with: user[:email]
    fill_in 'Display Name', with: user[:display_name]
    fill_in 'Password', with: user[:password]
    fill_in 'Password Confirmation', with: 'a different password'

    click_button 'Sign Up'

    expect(page).not_to have_content('You have signed up successfully')
    expect(page).to have_content("Password confirmation doesn't match")
  end
end
