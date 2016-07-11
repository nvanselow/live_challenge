require 'rails_helper'

feature 'delete a question', %{
  As a user
  I want to delete a question
  So that it is no longer in my list
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }

  before do
    sign_in_as(user)
  end

  scenario 'user can delete a question from the show page' do
    visit question_path(question)

    click_button('Delete Question')

    expect(page).to have_content('Question deleted')
    expect(page).not_to have_content(question.title)
  end
end
