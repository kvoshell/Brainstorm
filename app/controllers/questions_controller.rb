class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update]
  helper_method :render_view_by_department

  def index
    order_filter = params[:filter] || 'newest'

    @questions = Question.index_by_search(params).order(OrderHelper.sort_by_filter(order_filter))

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(questions_params)

    if @question.save
      redirect_to render_view_by_department
    else
      flash[:alert] = "We were unable to save your question!"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(questions_params)
      redirect_to render_view_by_department
    else
      flash[:alert] = "We were unable to change your question!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private

  def questions_params
    params.require(:question).permit(:user_id, :title, :body, :department)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def render_view_by_department
    "/" + @question.department.downcase.tr(" ", "_") + "s"
  end
end
