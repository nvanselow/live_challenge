require 'rails_helper'

feature 'users signs in', %{
  As a user
  I want to sign in
  So that I can start using questions
} do
  # ACCEPTANCE CRITERIA
  # [X] If I specify a valid, previously reigstered email and password,
  #     I am authenticated and I gain access to the system
  # [ ] If I provide an invalid email and password I am unauthenticated
  # [ ] If I am already signed in, I can't sign in again

  let(:user) { FactoryGirl.create(:user) }

  before do
    visit root_path

    click_link 'Sign In'
  end

  scenario 'an existing user provides valid email and password' do
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Sign In')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end
end
