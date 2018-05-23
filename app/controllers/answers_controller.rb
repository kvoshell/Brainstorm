class AnswersController < ApplicationController
  before_action :set_question, except: :index

  def index
    order_filter = params[:filter] || 'newest'

    @answers = current_user.answers.order(OrderHelper.sort_by_filter(order_filter))
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    AuraTracker.manage_aura('new_answer', @answer.user_id)

    if @answer.save
      render "questions/show"
    else
      flash[:alert] = "We were unable to answer that question!"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      render "questions/show"
    else
      flash[:alert] = "We were unable to change your answer!"
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
