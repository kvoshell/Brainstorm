class DevelopmentsController < ApplicationController
  def index
    @questions = Question.where(department: 0)
  end
end
