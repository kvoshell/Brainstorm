class DevelopmentsController < ApplicationController

  def index
    order_filter = params[:filter] || 'newest'

    @questions = Question.where(department: 0).order(OrderHelper.sort_by_filter(order_filter))
  end
end
