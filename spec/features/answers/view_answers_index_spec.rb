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

  scenario 'the most recent answers are at the top' do
    old_answer = FactoryGirl.create(:answer,
                                    question: question,
                                    created_at: DateTime.new(2016, 7, 4, 8, 0))
    new_answer = FactoryGirl.create(:answer,
                                    question: question,
                                    created_at: DateTime.new(2016, 7, 12, 9, 0))
    mid_answer = FactoryGirl.create(:answer,
                                    question: question,
                                    created_at: DateTime.new(2016, 7, 12, 8, 0))

    visit question_path(question)

    expect(new_answer.body).to appear_before(old_answer.body)
    expect(new_answer.body).to appear_before(mid_answer.body)
    expect(mid_answer.body).to appear_before(old_answer.body)
  end
end

private

def expect_answer(answer)
  expect(page).to have_content(answer.body)
  expect(page).to have_content(answer.name)
end
