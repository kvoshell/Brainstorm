class DesignsController < ApplicationController

  def index
    order_filter = params[:filter] || 'newest'

    @questions = Question.where(department: 1).order(OrderHelper.sort_by_filter(order_filter))
  end
end
