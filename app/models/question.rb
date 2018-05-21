class Question < ApplicationRecord
  has_many :answers

  validates :title, length: { minimum: 10, maximum: 150 }
  validates :body, length: { minimum: 2, maximum: 2000 }

  validates_presence_of :user_id, :department

  enum department: ["Development", "Design", "Account Management", "Other"]

  def self.index_by_search(params)
    if params[:search]
      
      if params[:search] == 'asked'
        questions = Question.where(user_id: params[:user_id])
      elsif params[:search] == 'answered'
        answers = Answer.where(user_id: params[:user_id]).map(&:question_id)
        questions = Question.find(answers)
      else
        questions = Question.all
      end

    else
      questions = Question.all
    end

    questions
  end
end
