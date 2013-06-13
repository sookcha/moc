class Comment < ActiveRecord::Base
  belongs_to :link
  has_many :childComment
  attr_accessible :author, :body
end