class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers

  validates :user_name, length: { minimum: 2, maximum: 40 }, uniqueness: { case_sensitive: false }
  validates :title, length: { minimum: 2, maximum: 40 }
end
