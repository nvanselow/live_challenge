require 'rails_helper'

feature 'view the questions index', %{
  As a user
  I want to view a list of my questions
  So that I can see all the questions I have created
} do
  # Acceptance Criteria
  # [X] User can navigate to the questions index from the homepage
  # [X] User can navigate to the questions index from the nav bar
  # [X] User views all of their own questions
  # [X] User cannot see a question created by a different user
  # [X] Only authenticated users can view the questions index

  let(:user) { FactoryGirl.create(:user) }
  let!(:questions) { FactoryGirl.create_list(:question, 3, user: user) }

  before do
    sign_in_as(user)
  end

  scenario 'user visits the questions index from the homepage' do
    visit root_path

    within('nav') do
      click_link 'All Questions'
    end

    expect_to_have_all_questions(questions)
  end

  scenario 'user visits the questions index from the homepage' do
    visit root_path

    within('.content') do
      click_link 'View All Questions'
    end

    expect_to_have_all_questions(questions)
  end

  scenario 'user views all of their own questions' do
    visit root_path

    within('nav') do
      click_link 'All Questions'
    end

    expect_to_have_all_questions(questions)
  end

  scenario 'there are questions from multiple users in the db, but the user '\
           'only sees their own questions' do
    another_user = FactoryGirl.create(:user)
    other_user_question = FactoryGirl.create(:question, user: another_user)

    visit questions_path

    expect_to_have_all_questions(questions)
    expect(page).not_to have_content(other_user_question.title)
  end

  scenario 'an unauthenticated user cannot see the questions index' do
    sign_out

    visit questions_path

    expect(page).to have_content('You need to sign in or sign up before '\
                                 'continuing')
    expect(page).not_to have_content(questions[0].title)
  end
end

private

def expect_to_have_all_questions(questions)
  questions.each do |question|
    expect(page).to have_content(question.title)
  end
end
