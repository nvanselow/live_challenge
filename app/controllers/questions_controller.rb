class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @questions = Question.all_for(current_user)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      flash[:success] = 'Question created!'
      redirect_to question_path(@question)
    else
      flash[:alert] = 'There was a problem creating that question'
      @errors = @question.errors.full_messages
      render 'questions/new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:success] = 'Question updated!'
      redirect_to question_path(@question)
    else
      flash[:alert] = 'There was a problem updating that question'
      @errors = @question.errors.full_messages
      render 'questions/edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
