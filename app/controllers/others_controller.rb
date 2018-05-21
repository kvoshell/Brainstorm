class OthersController < ApplicationController

  def index
    order_filter = params[:filter] || 'newest'

    @questions = Question.where(department: 3).order(OrderHelper.sort_by_filter(order_filter))
  end
end
