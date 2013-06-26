class Comment < ActiveRecord::Base
  belongs_to :link
  has_many :childcomment
  attr_accessible :author, :body
end