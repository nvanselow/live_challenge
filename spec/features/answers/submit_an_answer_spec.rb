require 'rails_helper'

feature 'submit an answer for a question', %{
  As a student
  I want to submit an answer to a question
  So that the instructor can see my answer and provide feedback
} do
  let!(:question) { FactoryGirl.create(:question) }
  let(:answer) { FactoryGirl.attributes_for(:answer) }

  scenario 'student can visit the question link to answer a question' do
    visit "/answer_questions/#{question.long_id}"

    expect(page.status_code).not_to eq(404)
    expect(page).to have_content(question.body)
    expect(page).to have_css('form')
  end

  scenario 'student visits a bad link and sees a 404 page' do
    visit '/answer_question/bad-id'

    expect(page.status_code).to eq(404)
  end

  scenario 'student submits an answer' do
    visit "/answer_questions/#{question.long_id}"

    fill_in('Answer', with: answer[:body])
    click_button('Submit Answer')
  end
end
