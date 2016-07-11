require 'rails_helper'

feature 'show a shareable link to the question', %{
  As a user
  I want to copy a link to my question
  So that I can share it so other people can answer the question
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user) }

  scenario 'user views the shareable link on the details page' do
    sign_in_as(user)

    visit question_path(question)

    expect(page).to have_content('Shareable Link:')
    expect(page).to have_content('http://www.example.com/answer_questions/'\
                                 "#{question.long_id}")
  end

  scenario 'an unauthenticated user can view the question to answer' do
    visit "/answer_questions/#{question.long_id}"

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.body)
  end
end
