require 'rails_helper'

feature 'create a new question', %{
  As a user
  I want to add a question
  So that I can send that question to my students
} do
  # Acceptance Criteria
  # [ ] User can navigate to the create question form from the homepage
  # [ ] User can navigate to the create question form from the navbar
  # [ ] If user enters valid question info into the form, the user sees
  #     a success message and is taken to the question show page
  # [ ] If a user enters invalid information, they see an error message with
  #     with information about what to fix
  # [ ] The user can enter markdown in the question body text
  # [ ] The user can preview their formatted question as they type

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.attributes_for(:question) }

  before do
    sign_in_as(user)
  end

  scenario 'user cannot create a question if not authenticated' do
    sign_out

    expect(page).not_to have_content('Create a Question')

    visit new_question_path

    expect(page).to have_content('Please sign in to create a question')
  end

  scenario 'user navigates to the create question form from the homepage' do
    within('.content') do
      click_link('Create a Question')
    end

    expect_create_question_form
  end

  scenario 'user navigates to create question from the navbar' do
    within('nav') do
      click_link('Create a Question')
    end

    expect_create_question_form
  end

  scenario 'user enters information for a valid question' do
    visit new_question_path

    fill_in('Title', with: question[:title])
    fill_in('Body', with: question[:body])

    click_button('Save Question')

    expect(page).to have_content('Question created')
    expect(page).not_to have_content('There was a problem')
    expect(page).to have_content(question[:title])
    expect(page).to have_content(question[:body])
  end

  scenario 'user tries to submit a blank form' do
    visit new_question_path

    click_button('Save Question')

    expect(page).to have_content('There was a problem')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(page).not_to have_content('Question created')
  end
end

private

def expect_create_question_form
  expect(page).to have_content('Create a Question')
  expect(page).to have_css('form.question')
end
