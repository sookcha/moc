class User < ActiveRecord::Base
  has_many :link
  has_many :feed
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:username, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
