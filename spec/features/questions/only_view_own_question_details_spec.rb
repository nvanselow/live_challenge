require 'rails_helper'

feature 'only creator of question can view show page' do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  scenario 'owner of question can view show page' do
    sign_in_as(user)

    visit question_path(question)

    expect(page).to have_content(question.title)
    expect(page).not_to have_content('You do not have permission to do that.')
  end

  scenario 'user attempts to view details of a question they did not create' do
    another_user = FactoryGirl.create(:user)
    sign_in_as(another_user)

    visit question_path(question)

    expect(page).to have_content('You do not have permission to do that.')
    expect(page).not_to have_content(question.title)
  end
end
