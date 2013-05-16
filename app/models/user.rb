class User < ActiveRecord::Base
  has_many :link
  has_many :feed
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :relationships, source: :following
  
  has_many :reverse_relationships, foreign_key: "following_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:username, :password, :password_confirmation, :remember_me
  
  def following?(other_user)
    relationships.find_by_following_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(following_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_following_id(other_user.id).destroy
  end
  
end
