require 'rails_helper'

feature 'users signs in', %{
  As a user
  I want to sign in
  So that I can start using questions
} do
  # ACCEPTANCE CRITERIA
  # [X] If I specify a valid, previously reigstered email and password,
  #     I am authenticated and I gain access to the system
  # [X] If I provide an invalid email and password I am unauthenticated
  # [X] If I am already signed in, I can't sign in again

  let(:user) { FactoryGirl.create(:user) }
  let(:bad_email) { 'bad@email.com' }
  let(:bad_password) { 'bad_password' }

  before do
    visit root_path

    within('nav') do
      click_link 'Sign In'
    end
  end

  scenario 'an existing user provides valid email and password' do
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Sign In')

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).not_to have_content('Invalid Email or password')
  end

  scenario 'a user enters an invalid email and password' do
    fill_in('Email', with: bad_email)
    fill_in('Password', with: bad_password)
    click_button('Sign In')

    expect_invalid_sign_in
  end

  scenario 'a user enters the wrong password for an existing email' do
    fill_in('Email', with: user.email)
    fill_in('Password', with: bad_password)
    click_button('Sign In')

    expect_invalid_sign_in
  end

  scenario 'an already authenticated user tries to sign in again' do
    sign_in_as(user)

    visit new_user_session_path

    expect(page).to have_content('You are already signed in')
  end
end

private

def expect_invalid_sign_in
  expect(page).to have_content('Invalid Email or password')
  expect(page).not_to have_content('Sign Out')
  expect(page).not_to have_content('Signed in successfully')
end
