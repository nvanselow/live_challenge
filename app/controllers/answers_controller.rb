class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      flash[:success] = 'Your answer was submitted!'
    else
      flash[:alert] = 'There were some problems with your answer'
      @errors = @answer.errors.full_messages
    end

    render 'answer_questions/show'
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
