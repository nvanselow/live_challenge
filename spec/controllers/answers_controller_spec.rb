require 'rails_helper'

describe Api::V1::AnswersController, type: :controller do
  describe 'GET /api/v1/questions/:question_id/answers' do
    it 'gets all the answers for a question' do
      question = FactoryGirl.create(:question)
      answers = FactoryGirl.create_list(:answer, 3, question: question)

      get :index, question_id: question.id
      json = JSON.parse(response.body)

      ids = json['answers'].map { |c| c['id'] }

      answers.each do |answer|
        expect(ids).to include(answer.id)
      end
    end
  end
end
