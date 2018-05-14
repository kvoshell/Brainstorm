class QuestionsController < ApplicationController
  def index
    # byebug
    @questions = Question.index_by_search(params)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def questions_params
    params.require(:question).permit(:user_id, :title, :body, :department)
  end
end
