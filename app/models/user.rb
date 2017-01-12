require "bcrypt"
class User < ActiveRecord::Base
  validates :email, :user_name, presence: true
  validates :email, :user_name, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes
  include BCrypt

  def password
    @password ||= Password.new(self.hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end


  def self.authenticate(user_email, plain_text_password)
    user = User.find_by(:email => user_email)
    if user && user.password == plain_text_password
      user
    else
      nil
      # This is an error message that is being returned
    end
  end

end
