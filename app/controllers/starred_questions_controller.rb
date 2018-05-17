class StarredQuestionsController < ApplicationController
  before_action :set_starred_question, only: :destroy
  helper_method :original_question_answers

  def index
    order_filter = params[:filter] || 'newest'

    starred_questions = StarredQuestion.where(user_id: current_user.id)

    @questions = if (order_filter == 'most_answers' || order_filter == 'least_answers')
      OrderHelper.starred_questions_sort_by_filter(starred_questions, order_filter)
    else
      starred_questions.order(OrderHelper.sort_by_filter(order_filter))
    end
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

  def original_question_answers(question_id)
    Question.find(question_id).answers.count
  end

  def set_starred_question
    @question = StarredQuestion.find_by(user_id: current_user.id, question_id: params[:id])
  end

  def starred_question_params
    params.require(:starred_question).permit(:user_id, :question_id, :title, :body, :department)
  end
end
