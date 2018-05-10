class AccountManagementsController < ApplicationController
  def index
    @questions = Question.where(department: 2)
  end
end
