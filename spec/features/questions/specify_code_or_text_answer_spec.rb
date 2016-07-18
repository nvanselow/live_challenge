require 'rails_helper'

feature 'create a code question', %{
  As a user
  I want to specify if I question should be a code question
  So that students can enter code for their answer
} do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.attributes_for(:question) }
  before do
    sign_in_as(user)
    new_question_path
  end

  scenario 'user selects text-based question' do
    choose('Text-Based Answer')

    click_button('Save Question')

    expect(page).to have_content(question[:title])
    expect(page).to have_content('Text-Based Answers')
  end

  scenario 'user selects code-based question' do
    choose('Code-Based Answer')

    click_button('Save Question')

    expect(page).to have_content(question[:title])
    expect(page).to have_content('Code-Based Answers')
  end

  scenario 'preference for code remains when viewing edit form' do
    question = FactoryGirl.create(:code_question)

    visit edit_question_path(question)

    expect(input('#code_based_question')).to be_checked
  end

  scenario 'preference for text remains when viewing edit form' do
    question = FactoryGirl.create(:question)

    visit edit_question_path(question)

    expect(input('#text_based_question')).to be_checked
  end
end

def fill_in_question_form
  fill_in('Title', with: question[:title])
  fill_in('Body', with: question[:body])
end
