class Tag < ApplicationRecord
  before_save { name.downcase! }

  belongs_to :question

  validates :name, length: { maximum: 15 }, uniqueness: { case_sensitive: false }
end
