class OthersController < ApplicationController
  def index
    @questions = Question.where(department: 3)
  end
end
