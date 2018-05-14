class QuestionsController < ApplicationController
  def index
    @questions = Question.all
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
    require(:question).permit(:user_id, :title, :body, :department)
  end
end
