class Question < ApplicationRecord
  has_many :answers

  enum department: [:Development, :Design, :Account_management, :Other]

  def self.index_by_search(params)
    if params[:search]
      if params[:search] == 'asked'
        questions = Question.where(user_id: params[:user_id])
      elsif params[:search] == 'answered'
        answers = Answer.where(user_id: params[:user_id]).map(&:question_id)
        questions = Question.find(answers)
      elsif params[:search] == 'starred'
        questions = Question.where(user_id: params[:user_id])
      else
        questions = Question.all
      end
    else
      questions = Question.all
    end
    questions
  end
end
