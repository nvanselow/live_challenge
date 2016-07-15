require 'rails_helper'

feature 'view questions index', %{
  As a user
  I want to see answers submitted for my question
  So that I can see how students are performing on my question
} do
  let(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question, user: user) }
  let!(:answers) { FactoryGirl.create_list(:answer, 3, question: question) }

  before do
    sign_in_as(user)
    visit question_path(question)
  end

  scenario 'visit the questions details page to see all answers' do
    answers.each do |answer|
      expect_answer(answer)
    end
  end

  scenario 'answers can be seen by question owner even if set to private' do
    private_answer = FactoryGirl.create(:answer,
                                        question: question,
                                        private_answer: true)

    visit question_path(question)

    expect_answer(private_answer)
  end
end

private

def expect_answer(answer)
  expect(page).to have_content(answer.body)
  expect(page).to have_content(answer.name)
end
