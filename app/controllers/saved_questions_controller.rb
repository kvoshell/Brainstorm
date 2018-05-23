class SavedQuestionsController < ApplicationController
  before_action :set_saved_question, only: :destroy
  helper_method :original_question

  def index
    order_filter = params[:filter] || 'newest'

    saved_questions = SavedQuestion.where(user_id: current_user.id)

    @questions = if (order_filter == 'most_answers' || order_filter == 'least_answers')
      OrderHelper.saved_questions_sort_by_filter(saved_questions, order_filter)
    else
      saved_questions.order(OrderHelper.sort_by_filter(order_filter))
    end
  end

  def new
    @question = SavedQuestion.new
  end

  def create
    @question = SavedQuestion.new(saved_question_params)
    AuraTracker.manage_aura('saved_question', @question.question.user_id)
    @question.save

    redirect_back(fallback_location: root_path)
  end

  def destroy
    AuraTracker.manage_aura('unsave_question', @question.question.user_id)
    @question.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def original_question(question_id)
    Question.find(question_id)
  end

  def set_saved_question
    @question = SavedQuestion.find_by(user_id: current_user.id, question_id: params[:id])
  end

  def saved_question_params
    params.require(:saved_question).permit(:user_id, :question_id, :title, :body, :department)
  end
end
