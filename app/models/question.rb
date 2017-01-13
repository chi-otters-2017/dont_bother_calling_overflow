class Question < ActiveRecord::Base
	validates :title, :body, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
end