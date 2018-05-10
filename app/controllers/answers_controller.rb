class AnswersController < ApplicationController
  # byebug
  before_action :set_question

  def index
    @answers = @question.answers.all
  end

  def create
    @answer = @question.answers.create(answer_params)
  end

  def show
  end

  def destroy
  end

  private

  def answer_params
    # params.require(:answer).permit(:question_id, :user_id, :body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
