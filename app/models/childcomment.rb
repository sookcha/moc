class Childcomment < ActiveRecord::Base
  belongs_to :comment
  attr_accessible :author, :body
end
