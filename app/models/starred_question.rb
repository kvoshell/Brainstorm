class StarredQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates_presence_of :user_id, :question_id, :department, :title, :body

  enum department: ["Development", "Design", "Account Management", "Other"]
end
