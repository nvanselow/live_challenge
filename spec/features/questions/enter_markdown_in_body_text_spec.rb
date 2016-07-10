require 'rails_helper'

feature 'markdown is supported in question body', %{
  As a user
  I want to add markdown to my question
  So that I can show code samples in my question
}, js: true do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.attributes_for(:question) }

  before do
    sign_in_as(user)
  end

  xscenario 'user enters markdown into the body to see a preview' do
    visit new_question_path

    fill_in('Title', with: question[:title])
    fill_in('Body', with: question[:body])
    page.execute_script(%q{
      var event = new Event('input', { bubbles: true });
      var element = document.getElementById('question_body');
      element.dispatchEvent(event);
    })

    expect(page.html).to include('This is some text for a question I '\
                                 'want to add. It has <b>markdown</b>.')
  end
end
