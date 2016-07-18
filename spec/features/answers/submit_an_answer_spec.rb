require 'rails_helper'

feature 'submit an answer for a question', %{
  As a student
  I want to submit an answer to a question
  So that the instructor can see my answer and provide feedback
} do
  let!(:question) { FactoryGirl.create(:question) }
  let(:answer) { FactoryGirl.attributes_for(:answer) }



  scenario 'student visits a bad link and sees a 404 page' do
    visit '/answer_questions/bad-id'

    expect(page.status_code).to eq(404)
  end

  context 'student visits a valid question link' do
    before do
      visit "/answer_questions/#{question.long_id}"
    end

    scenario 'student can visit the question link to answer a question' do
      expect(page.status_code).not_to eq(404)
      expect(page).to have_content(question.body)
      expect(page).to have_css('form')
    end

    scenario 'student submits an answer' do
      fill_in('Answer', with: answer[:body])
      click_button('Submit Answer')

      expect(page).to have_content('Your answer was submitted')
    end

    scenario 'student attempts to submit a blank answer' do
      click_button('Submit Answer')

      expect(page).not_to have_content('Your answer was submitted')
      expect(page).to have_content('There were some problems with your answer')
      expect(page).to have_content("Body can't be blank")
    end
  end
end
