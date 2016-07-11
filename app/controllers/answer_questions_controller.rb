class AnswerQuestionsController < ApplicationController
  def show
    @question = Question.where(long_id: params[:id]).first
  end
end
