class AnswerQuestionsController < ApplicationController
  def show
    @question = Question.where(long_id: params[:id]).first || not_found
    @answer = Answer.new
  end
end
