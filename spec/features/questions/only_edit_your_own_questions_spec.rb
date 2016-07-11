require 'rails_helper'

feature 'only edit your own questions' do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  scenario 'user can edit a question they created' do
    sign_in_as(user)

    visit edit_question_path(question)

    expect(page).to have_content('Edit Question')
    expect(page).not_to have_content('You do not have permission to do that.')
  end

  scenario 'user cannot edit a question they did not create' do
    another_user = FactoryGirl.create(:user)
    sign_in_as(another_user)

    visit edit_question_path(question)

    expect(page).to have_content('You do not have permission to do that.')
    expect(page).not_to have_content('Edit Question')
  end
end
