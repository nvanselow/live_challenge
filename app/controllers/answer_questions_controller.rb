class AnswerQuestionsController < ApplicationController
  def show
    @question = Question.where(long_id: params[:id]).first
    @answer = Answer.new
  end
end
