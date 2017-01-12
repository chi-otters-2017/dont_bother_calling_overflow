class User < ActiveRecord::Base
  validates :email, :user_name, presence: true
  validates :email, :user_name, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes
end
