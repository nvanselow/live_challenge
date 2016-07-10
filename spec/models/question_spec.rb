require 'rails_helper'

describe Question, type: :model do
  it { should have_valid(:title).when('A title', 'Title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:body).when('Some text', '**with markdown**') }
  it { should_not have_valid(:body).when('', nil) }

  it { should belong_to(:user) }

  describe '.all_for' do
    it 'gets all the questions made by a specified user' do
      user = FactoryGirl.create(:user)
      user_questions = FactoryGirl.create_list(:question, 3, user: user)
      another_users_questions = FactoryGirl.create_list(:question, 2)

      questions = Question.all_for(user)

      user_questions.each do |question|
        expect(questions).to include(question)
      end

      another_users_questions.each do |question|
        expect(questions).not_to include(question)
      end
    end
  end
end
