require 'rails_helper'

feature 'upload a profile photo', %q{
  As a user
  I want to upload a profile photo
  So it is easier for other users to identify me
} do
  # ACCEPTANCE CRITERIA
  # [X] I can upload a photo and it appears in the nav bar
  # [X] I get an error message if I try to upload an invalid file type
  # [ ] Uploading a file is optional

  let(:user) { FactoryGirl.attributes_for(:user) }
  let(:invalid_photo) { 'spec/support/test_avatar.pdf' }

  scenario 'user selects a valid photo' do
    complete_form_with_photo(user[:avatar].path)

    expect(page).to have_content('You have signed up successfully')
    expect(page).to have_css("img[src*='avatar.jpeg']")
  end

  scenario 'user selects an invalid file type for the photo' do
    complete_form_with_photo(invalid_photo)

    expect(page).not_to have_content('You have signed up successfully')
    expect(page).to have_content('You are not allowed to upload "pdf" files')
  end

  scenario 'user does not choose to upload an avatar photo' do
    complete_form_with_photo(nil)

    expect(page).to have_content('You have signed up successfully')
  end
end

private

def complete_form_with_photo(file_path = nil)
  visit new_user_registration_path

  fill_in 'Display Name', with: user[:display_name]
  fill_in 'Email', with: user[:email]
  fill_in 'Password', with: user[:password]
  fill_in 'Password Confirmation', with: user[:password]

  attach_file 'Upload an Avatar', file_path if file_path

  click_button 'Sign Up'
end
