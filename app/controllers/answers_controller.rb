class AnswersController < ApplicationController
  before_action :set_question

  def index
    @answers = if params[:search] && params[:search] == 'answered'
      Answer.where(user_id: current_user)
    else
      @question.answers.all
    end
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id

    if @answer.save
      render "questions/show"
    else
      flash[:error] = "We were unable to answer that question!"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :body)
  end

  def set_question
    unless params[:search]
      @question = Question.find(params[:question_id])
    end
  end
end
