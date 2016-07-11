require 'rails_helper'

describe Question, type: :model do
  it { should have_valid(:title).when('A title', 'Title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:body).when('Some text', '**with markdown**') }
  it { should_not have_valid(:body).when('', nil) }

  it { should belong_to(:user) }

  describe 'add_long_id' do
    it 'adds a unique long id before the question is created' do
      question = FactoryGirl.build(:question, long_id: nil)
      question.save

      expect(question.long_id).not_to be(nil)
    end

    it 'does not change the id when the question is updated' do
      question = FactoryGirl.create(:question)
      old_long_id = question.long_id
      question.update(title: 'updated')

      question = Question.find(question.id)
      expect(question.title).to eq('updated')
      expect(question.long_id).to eq(old_long_id)
    end
  end

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

  describe '#shareable_link' do
    it 'returns a shareable link for the question' do
      question = FactoryGirl.create(:question)

      expect(question.shareable_link)
            .to eq("/answer_questions/#{question.long_id}")
    end
  end
end
