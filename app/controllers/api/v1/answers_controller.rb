class Api::V1::AnswersController < ApiController
  def index
    question = Question.find(params[:question_id])
    answers = question.answers

    render json: { answers: answers }, status: :ok
  end
end
