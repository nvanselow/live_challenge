require 'rails_helper'

feature 'edit a question', %{
  As a user
  I want to edit a question
  So that I can change some aspect of the question
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  before do
    sign_in_as(user)
  end

  scenario "user can edit a question from the question details page" do
    visit question_path(question)

    click_link('Edit')

    expect(page).to have_content('Edit Question')
    expect(page).to have_css('form')
  end

  scenario 'user edits the question correctly' do
    updated_title = 'Updated Title'
    updated_body = 'Updated Body'

    visit edit_question_path(question)

    fill_in('Title', with: updated_title)
    fill_in('Body', with: updated_body)
    click_button('Save Question')

    expect(page).to have_content('Question updated!')
    expect(page).to have_content(updated_title)
    expect(page).to have_content(updated_body)
  end

  scenario 'user tries to submit a blank form' do
    visit edit_question_path(question)

    fill_in('Title', with: '')
    fill_in('Body', with: '')
    click_button('Save Question')

    expect(page).not_to have_content('Question updated!')
    expect(page).to have_content('There was a problem updating that question')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
