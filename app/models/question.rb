class Question < ApplicationRecord
  has_many :answers

  enum department: { development: 0, design: 1, account_project_management: 2 }
end
