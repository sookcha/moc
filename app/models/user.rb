class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :links
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
         
 attr_accessible :email,:username, :password, :password_confirmation, :remember_me, :id
         
 def following?(current_user,other_user)
     relationA = Relationship.find_by_following_id(other_user.id)
     relationB = Relationship.find_by_follower_id(current_user.id)

     if relationA != nil && relationB != nil
       true
     else
       false
     end
   end        
end