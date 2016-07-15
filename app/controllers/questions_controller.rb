class QuestionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_question_owner, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all_for(current_user)
  end

  def show
    @question = MarkdownQuestion.new(params[:id])
    @shareable_link = "#{request.protocol}"\
                      "#{request.host}#{@question.shareable_link}"
    @answers = @question.question.answers
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

  def destroy
    Question.destroy(params[:id])
    flash[:success] = 'Question deleted!'
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def check_question_owner
    @question = Question.find(params[:id])

    if(@question.user != current_user)
      flash[:alert] = 'You do not have permission to do that.'
      redirect_to root_path
    end
  end
end
