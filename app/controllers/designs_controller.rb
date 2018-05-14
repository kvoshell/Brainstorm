class DesignsController < ApplicationController

  def index
    filter = params[:filter] || 'newest'
  
    @questions = Question.where(department: 1).order(OrderHelper.sort_by_filter(filter))
  end
end
