class Question < ActiveRecord::Base
	validates :title, :body, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable

  def vote_tally
    (self.votes.where({upvote: true}).length) - (self.votes.where({upvote: false}).length)
  end
end
