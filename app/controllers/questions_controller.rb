class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:question_id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if(@question.save)
      flash[:success] = 'Question created!'
      redirect_to question_path(@question)
    else
      flash[:alert] = 'There was a problem creating that question'
      @errors = @question.errors.full_messages
      render 'questions/new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
