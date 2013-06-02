class Comment < ActiveRecord::Base
  belongs_to :link
  attr_accessible :author, :body
end