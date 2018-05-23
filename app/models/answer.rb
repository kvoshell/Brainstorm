class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true
  belongs_to :user

  validates :body, length: { minimum: 2 }

  validates_presence_of :question_id, :user_id
end
