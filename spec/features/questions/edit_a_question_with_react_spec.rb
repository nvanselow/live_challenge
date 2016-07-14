require 'rails_helper'

feature 'edit a question with react component', %{
  As a user
  I want to edit a question using a react component
  So that I can preview my question in processed markdown
}, js: true do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  before do
    sign_in_as(user)
  end

  scenario 'user can make changes to previous body of question' do
    visit edit_question_path(question)

    expect(page).to have_content(question.body)
  end
end
