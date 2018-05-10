class DesignsController < ApplicationController
  def index
    @questions = Question.where(department: 1)
  end
end
