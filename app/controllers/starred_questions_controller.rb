class StarredQuestionsController < ApplicationController
  before_action :set_starred_question, only: :destroy

  def index
    @questions = StarredQuestion.where(user_id: current_user.id)
  end

  def new
    @question = StarredQuestion.new
  end

  def create
    @question = StarredQuestion.create(starred_question_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @question.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_starred_question
    @question = StarredQuestion.find_by(user_id: current_user.id, question_id: params[:id])
  end

  def starred_question_params
    params.require(:starred_question).permit(:user_id, :question_id, :body, :title)
  end
end
