class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  attr_accessible :content, :user_id, :title, :url, :vote, :private
  
  paginates_per 20
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT following_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end